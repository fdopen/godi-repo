;; -*- lexical-binding: t; -*-
;;; omake.el --- Editing mode for OMake build files

;; Copyright (C) 2007-2011  David M. Cooke

;; Author: David M. Cooke <david.m.cooke@gmail.com>
;; Version: 1.1
;; Keywords: omake ocaml

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; Uses some code from python-mode.el, which has the following licence:
;; Copyright (C) 1992,1993,1994  Tim Peters
;; This software is provided as-is, without express or implied
;; warranty.  Permission to use, copy, modify, distribute or sell this
;; software, without fee, for any purpose and by any individual or
;; organization, is hereby granted, provided that the above copyright
;; notice and this paragraph appear in all copies.

;;; Commentary:
;;
;; Provides an editing mode for OMake build files. See
;; <http://omake.metaprl.org/> for more information on OMake.

;;; Code:

(require 'rx)

(defgroup omake nil
  "OMake editing commands for Emacs."
  :link '(custom-group-link :tag "Font Lock Faces group" font-lock-faces)
  :group 'tools
  :prefix "omake-")

(defcustom omake-indent-offset 4
  "Amount of indent that TAB adds."
  :type 'integer
  :safe #'integerp
  :group 'omake)

(defface omake-targets
  '((t (:inherit font-lock-function-name-face)))
  "Face to use for highlighting rule targets in Font-Lock mode."
  :group 'omake)


;; Taken from python-mode.el
(defun omake-shift-region (start end count)
  "Indent lines from START to END by COUNT spaces."
  (save-excursion
    (goto-char end)
    (beginning-of-line)
    (setq end (point))
    (goto-char start)
    (beginning-of-line)
    (setq start (point))
    (indent-rigidly start end count)))

;; Taken from python-mode.el
(defsubst omake-keep-region-active ()
  "Keep the region active in XEmacs."
  ;; Ignore byte-compiler warnings you might see.  Also note that
  ;; FSF's Emacs 19 does it differently; its policy doesn't require us
  ;; to take explicit action.
  (and (boundp 'zmacs-region-stays)
       (setq zmacs-region-stays t)))

;; Taken from python-mode.el
(defun omake-shift-region-left (start end &optional count)
  "Shift region of Omake code to the left.
The lines from the line containing the start of the current region up
to (but not including) the line containing the end of the region are
shifted to the left, by `omake-indent-offset' columns.

If a prefix argument is given, the region is instead shifted by that
many columns.  With no active region, dedent only the current line.
You cannot dedent the region if any line is already at column zero."
  (interactive
   (let ((p (point))
         (m (mark))
         (arg current-prefix-arg))
     (if m
         (list (min p m) (max p m) arg)
       (list p (save-excursion (forward-line 1) (point)) arg))))
  ;; if any line is at column zero, don't shift the region
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (back-to-indentation)
      (if (and (zerop (current-column))
               (not (looking-at "\\s *$")))
          (error "Region is at left edge"))
      (forward-line 1)))
  (omake-shift-region start end (- (prefix-numeric-value
                                    (or count omake-indent-offset))))
  (omake-keep-region-active))

;; Taken from python-mode.el
(defun omake-shift-region-right (start end &optional count)
  "Shift region of Omake code to the right.
The lines from the line containing the start of the current region up
to (but not including) the line containing the end of the region are
shifted to the right, by `omake-indent-offset' columns.

If a prefix argument is given, the region is instead shifted by that
many columns.  With no active region, indent only the current line."
  (interactive
   (let ((p (point))
         (m (mark))
         (arg current-prefix-arg))
     (if m
         (list (min p m) (max p m) arg)
       (list p (save-excursion (forward-line 1) (point)) arg))))
  (omake-shift-region start end (prefix-numeric-value
                                 (or count omake-indent-offset)))
  (omake-keep-region-active))



(defun omake-subst (test replace tree)
  "For elements matching TEST, apply REPLACE and substitute in TREE.
For each element EL (car or cdr of a cons cell) of TREE for which (TEST EL)
returns non-nil, substitute (non-destructively) the value of (REPLACE EL).

Only cons cells are followed. Replacements aren't followed.

See also `cl-subst'.
"
  (let ((p (funcall test tree)))
    (if p
        (funcall replace tree)
      (cond ((consp tree)
             (let ((a (omake-subst test replace (car tree)))
                   (d (omake-subst test replace (cdr tree))))
               (if (and (eq a (car tree)) (eq d (cdr tree)))
                   tree
                 (cons a d))))
            (t tree)))))

;; Building regular expressions out of simpler ones can be painful.
;; Also, Emacs's backslash quoting in strings makes regexps hard to read.
;; We use the `rx' package to make readable regexps.

(defun omake--re-ref-p (sym)
  "Returns non-nil if SYM is a symbol starting with a !."
  (and (symbolp sym)
       (string-prefix-p "!" (symbol-name sym))))

(defun omake--expand-re-ref (sym)
  "For symbols SYM matching `omake--re-ref-p', return the associated value.
The value of `omake--re-<sym>' is returned for symbols `!<sym>'; everything
else is returned as-is."
  (if (omake--re-ref-p sym)
      (let ((new-sym (intern-soft
                      (concat "omake--re-" (substring (symbol-name sym) 1)))))
        (if new-sym
            (symbol-value new-sym)
          sym))
    sym))

(defun omake--rx (regexp)
  "Substitute !-prefixed symbols in the `rx' regular expression REGEXP."
  (let ((re (omake-subst #'omake--re-ref-p
                         (lambda (x)
                           (list 'regexp (omake--expand-re-ref x)))
                         regexp)))
    (rx-to-string
     (if (and (consp re) (equal (car re) 'seq))
         re
       (cons 'seq re)))))

(defun omake--replace-regexp-value (tree)
  (omake-subst #'omake--re-ref-p #'omake--expand-re-ref
               (omake-subst (lambda (x) (and (consp x) (equal (car x) 'rx)))
                            (lambda (x) (omake--rx (cdr x)))
                            tree)))


(defvar omake-targets 'omake-targets
  "Face to use for highlighting targets.")

(defconst omake--re-special (rx (any "$(),.=:\"'`\\#?~\n")))
(defconst omake--re-not-special (rx (not (any "$(),.=:\"'`\\#?~\n"))))
(defconst omake--re-identifier "[_@A-Za-z0-9][-_@~A-Za-z0-9]*")
(defconst omake--re-single-char-identifier "[][@~_A-Za-z0-9&*<^?-]")
(defconst omake--re-pathid
  (omake--rx '(seq (group (* !identifier "."))
                   (group !identifier))))

(defconst omake--statements
  '("case"     "catch"  "class"   "declare"  "default"
    "do"       "else"   "elseif"  "export"   "extends"
    "finally"  "if"     "import"  "include"  "match"
    "open"     "raise"  "return"  "section"  "switch"
    "try"      "value"  "when"    "while")
  "List of keywords that begin statements")

(defconst omake--re-command
  (rx-to-string
   `(seq line-start
         (* space)
         (group (or ,@omake--statements))
         symbol-end)))

(defconst omake--re-block-opening-command
  (rx (or "if" "else" "elseif" "case" "when" "default" "try" "catch" "finally"
          "section" "while")))
(defconst omake--re-block-closing-command
  (rx (or "return" "raise" "value")))

(defconst omake--qualifiers
  '(;; Namespace qualifiers
    "private" "this" "global" "protected" "public"
    ;; Others
    "curry" "static")
  "List of keywords that are used as qualifiers in variable definitions")

(defconst omake--re-qualifier
  (regexp-opt omake--qualifiers 'words))

(defconst omake--dot-targets
  '(".BUILD_BEGIN" ".BUILD_FAILURE" ".BUILD_SUCCESS"
    ".BUILDORDER"  ".DEFAULT"       ".INCLUDE"
    ".MEMO"        ".ORDER"         ".PHONY"
    ".SCANNER"     ".STATIC"        ".SUBDIRS"))
(defconst omake--re-dot-targets
  (regexp-opt omake--dot-targets))

(defconst omake--re-variable-ref
  ;; group 1: $` or $,
  ;; group 2: path of pathid
  ;; group 3: id of pathid
  ;; group 4: single-char id
  (omake--rx
   '(seq (or "$" (group (or "$`" "$,")))
         (or (seq "(" !pathid ")")
             (group !single-char-identifier)))))

(defconst omake--re-dollar-function-call
  ;; group 1: $` or $,
  ;; group 2: path of pathid
  ;; group 3: id of pathid
  (omake--rx
   '(seq (or "$" (group (or "$`" "$,")))
         "(" !identifier
         space)))

(defconst omake--re-variable-def
  (omake--rx
   '(seq line-start
         (* space)
         (group !identifier
                (group (* "." !identifier))) ; for object members
         (group (\? "[]"))
         (* space)
         (group (\? "+"))
         "=")))

(defconst omake--re-object-def
  (omake--rx
   '(seq line-start
         (* space)
         (group !identifier)
         "."
         (* space)
         (group (\? "+"))
         "=")))

(defconst omake--re-multiline-function-def
  (omake--rx
   '(seq line-start
         (* space)
         (group !identifier (opt "." !identifier))
         (* space) "("
         ;; this should match id, ..., id, but we'll be sloppy
         (group (minimal-match (* nonl)))
         ")"
         (* space) "="
         (* space) line-end))
  "Regular expression that (loosely) matches the beginning of a multiline
function definintion")

(defconst omake--re-arrow-arg
  "=>"
  "Regular expression that (very loosely) matches a line that starts an
anonymous function argument.")

(defconst omake--re-rule
  (rx (seq line-start
           (* space)
           (group (minimal-match (* nonl)))
           ":"
           (* nonl) line-end))
  "Regular expression that (loosely) matches the rule header")

(defconst omake--re-comment
  (rx (seq (* space)
           (group "#" (* not-newline)))))

(defconst omake--re-blank-or-comment
  (rx (seq (* space)
           (group (or line-start "#"))))
  "Regular expression matching a blank or comment line.")

(defconst omake--string-syntax (string-to-syntax "|")) ; generic string

(defun omake--syntax-ppss (&optional pos)
  (unless pos (setq pos (point)))
  (save-excursion (syntax-ppss pos)))

(defun omake--in-comment-or-string-p (&optional pos)
  (let ((ppss (omake--syntax-ppss pos)))
    (or (nth 3 ppss) (nth 4 ppss))))
(defun omake--in-string-p (&optional pos)
  (nth 3 (omake--syntax-ppss pos)))

(defun omake--string-type (&optional pos)
  (let ((ppss (omake--syntax-ppss (or pos (point)))))
    (and (nth 3 ppss)
         (let ((quotes (get-text-property (nth 8 ppss) 'omake-string-quotes)))
           (if quotes
               (elt quotes 0)
             (lwarn '(omake) :warning
                    "OMake: found string @ %d, but no 'omake-string-quotes text property" (nth 8 ppss))
             nil)))))

(defun omake--matching-quotes-re (quotes)
  (let ((q-char (substring quotes 0 1)))
    (concat "\\(?:^\\|[^" q-char "]\\)\\("
            (regexp-quote quotes)
            "\\)\\(?:[^" q-char "]\\|$\\)")))

(defun omake--syntax-propertize-string (end)
  (let ((ppss (omake--syntax-ppss)))
    ;; Are we in a (generic) string?
    (when (eq t (nth 3 ppss))
      (let ((quotes (get-text-property (nth 8 ppss) 'omake-string-quotes)))
        (save-excursion
          (goto-char (max (point) (+ 1 (nth 8 ppss) (length quotes))))
          (when (re-search-forward (omake--matching-quotes-re quotes) end 'move)
            (let ((eos (match-end 1)))
              (put-text-property (1- eos) eos
                                 'syntax-table omake--string-syntax))))))))

(defun omake--font-lock-open-string (start quotes end)
  (unless (omake--in-comment-or-string-p start)
    (put-text-property start (1+ start) 'omake-string-quotes quotes)
    (put-text-property start (1+ start) 'syntax-table omake--string-syntax)
    (omake--syntax-propertize-string end))
  nil)

(eval-and-compile
  (defconst omake--re-open-string
    (rx (group "$") (group (or (+ ?\') (+ ?\"))))))

(defun omake-syntax-propertize (start end)
  (goto-char start)
  ;; Handle case where the region starts within a string.
  (omake--syntax-propertize-string end)
  (funcall
   (syntax-propertize-rules
    ;; quoted comment character
    ("[\\]#" (0 "_"))
    ;; \ doesn't quote in strings. (It probably should, esp. in $".." strings)
    ("[\\]" (0 (if (omake--in-string-p)
                   '(2)
                 '(9))))
    (omake--re-open-string
     (1 (ignore
         (omake--font-lock-open-string
          (match-beginning 1) (match-string-no-properties 2) end)))) )
   start end))

(defconst omake--font-lock-var-ref-re
  (omake--rx
   '(seq (or "$" (group-n 1 (or "$`" "$,")))
         (or (seq "("
                  (group-n 2 (* !identifier "."))
                  (or (seq (group-n 3 !identifier) ")")
                      (seq (group-n 4 !identifier) space)))
             (group-n 3 !single-char-identifier)))))

(defun omake--font-lock-var-ref (limit)
  (and (re-search-forward omake--font-lock-var-ref-re limit t)
       (or (not (omake--in-comment-or-string-p))
           (equal ?\" (omake--string-type)))))

(defvar omake-font-lock-keywords-var
  ;; This is processed by omake-font-lock-keywords.
  ;; (rx ...) forms get expanded with rx-to-string
  ;; !<id> inside an rx form are replaced with `(regexp ,omake--re-<id>)
  ;; before expansion.
  ;; Otherwise, !<id> gets expanded to the value of omake--re-<id>.
  '((!command . font-lock-keyword-face)

    ;; Variable and function references. We use prepend so that
    ;; references inside $"..." are highlighted too.
    (omake--font-lock-var-ref
     (1 font-lock-builtin-face prepend t)
     (2 font-lock-type-face prepend t)
     (3 font-lock-variable-name-face prepend t)
     (4 font-lock-function-name-face prepend t))

    ((rx line-start (* space) (group !qualifier) ".")
     (1 font-lock-type-face))

    ;; Object/variable assignments, function definitions
    ((rx line-start (* space)
         (opt !qualifier ".")
         (or
          (seq (group-n 1 (+ !identifier "."))
               (* space) (opt "+"))
          (seq (group-n 1 (* !identifier ".") !identifier)
               (opt "[]") (* space) (opt "+"))
          (seq (group-n 1 (* !identifier "."))
               (group-n 2 !identifier)
               (* space) "(" (* (not (any ")" ?\n))) ")" (opt space))
          )
          "=")
     (1 font-lock-variable-name-face nil t)
     (2 font-lock-function-name-face nil t))

    ;; Targets
    ((rx line-start (* space)
         (or
          (group !dot-targets)
          (group (+ (not (any "$(),=:\"'`\\#?~\n")))))
         (* space) ":")
     (1 font-lock-preprocessor-face nil t)
     (2 omake-targets nil t))

    ;; Highlight ~ (used for keyword arguments to functions).
    ;; Although, this face is by default empty.
    ("~" . font-lock-negation-char-face)
))

(defun omake-font-lock-keywords ()
  (omake--replace-regexp-value omake-font-lock-keywords-var))



;;; Indentation

(defun omake--alist (&rest body)
  (let (alist)
    (while body
      (if (not (keywordp (car body)))
          (error "Non-keyword in unexpected place")
        (push (cons (pop body) (pop body)) alist)))
    alist))

(defun omake--alist-from-match (&rest body)
  (let ((alist (list
                (cons :range (cons (match-beginning 0) (match-end 0)))))
        kw r)
    (while body
      (setq kw (pop body))
      (if (not (keywordp kw))
          (error "Non-keyword in unexpected place")
        (setq r (pop body))
        (push (cons kw (cons (match-beginning r) (match-end r))) alist)))
    alist))

(defun omake--match (alist symbol)
  (cdr (assq symbol alist)))
(defun omake--match-begin (alist symbol)
  (car (omake--match alist symbol)))
(defun omake--match-end (alist symbol)
  (cdr (omake--match alist symbol)))

(defmacro omake--def-point-bol (name pat &rest body)
  `(defun ,name ()
     (save-excursion
       (let ((here (point)))
         (beginning-of-line)
         (if (and (looking-at ,pat)
                  (>= (match-end 0) here))
             (omake--alist-from-match ,@body)
           nil)))))

(omake--def-point-bol omake-point-command omake--re-command
                      :command 1)
(omake--def-point-bol omake-point-variable-def omake--re-variable-def
                      :id 1 :member 2 :array 3 :add 4)
(omake--def-point-bol omake-point-object-def omake--re-object-def
                      :id 1 :add 2)
(omake--def-point-bol omake-point-multiline-function-def
                      omake--re-multiline-function-def
                      :params 1)
(omake--def-point-bol omake-point-rule omake--re-rule
                      :target 1)

(defun omake-point-arrow-arg ()
  (save-excursion
    (let ((here (point)))
      (beginning-of-line)
      (if (and (re-search-forward omake--re-arrow-arg (line-end-position) t)
               (>= (match-end 0) here))
          (omake--alist-from-match :arrow 1)
        nil))))

(defun omake-point-comment ()
  (save-excursion
    (let ((here (point)))
      (beginning-of-line)
      (if (and (re-search-forward omake--re-comment (line-end-position) t)
               (<= (match-beginning 1) here))
          (omake--alist-from-match :comment 1)
        nil))))

(defun omake-point-variable-ref ()
  (save-excursion
    (let ((here (point)))
      (if (and (search-backward "$" (line-beginning-position))
               (looking-at omake--re-variable-ref)
               (>= (match-end 0) here))
          (omake--alist-from-match :id 1)
        nil))))

(defun omake--indent-to (n)
  (beginning-of-line)
  (delete-horizontal-space)
  (indent-to n))

(defun omake--round-down-to-indent-offset (col)
  (* (/ col omake-indent-offset) omake-indent-offset))

(defun omake-indent ()
  (interactive)
  (let* ((ci (current-indentation))
         (rci (omake--round-down-to-indent-offset ci))
         (cc (current-column))
         (move-to-indentation
          (if (<= cc ci) 'back-to-indentation 'ignore))
         (max (omake-compute-max-indentation)))
    (cond
     ((= ci 0)
      (omake--indent-to max))
     ((/= rci ci)
      (omake--indent-to (+ rci omake-indent-offset)))
     ;; dedent out a level if this was the previous command also,
     ;; unless we're in column 1
     ((equal last-command this-command)
      (if (/= cc 0)
          (omake--indent-to (omake--round-down-to-indent-offset (1- cc)))
        (omake--indent-to max)))
     ((< ci max)
      (omake--indent-to (+ rci omake-indent-offset)))
     ((> ci max)
      (omake--indent-to max))
     (t nil))
    (funcall move-to-indentation)))

(defun omake-compute-max-indentation ()
  (let ((ci (current-indentation)))
    (save-excursion
      (if (bobp)
          ci
        (forward-line -1)
        (while (looking-at "^\\s-*$")
          (forward-line -1))
        (cond
         ((and (omake-point-comment)
               (<= ci
                   (progn
                     (forward-comment (- (point-max)))
                     (current-indentation))))
          ci)
         ((omake-statement-opens-block-p)
          (+ (current-indentation) omake-indent-offset))
         ((omake-statement-closes-block-p)
          (- (current-indentation) omake-indent-offset))
         (t
          (current-indentation)))))))

(defun omake-statement-opens-block-p ()
  (save-excursion
    (beginning-of-line)
    (let (r)
      (cond
       ((setf r (omake-point-command))
        (goto-char (omake--match-begin r :command))
        (looking-at omake--re-block-opening-command))
       ((omake-point-object-def) t)
       ((setf r (omake-point-variable-def))
        (goto-char (omake--match-end r :range))
        (looking-at (rx (* space) line-end)))
       ((setf r (omake-point-multiline-function-def))
        (goto-char (omake--match-end r :range))
        (looking-at (rx (* space) line-end)))
       ((omake-point-rule) t)
       ((omake-point-arrow-arg) t)
       (t nil))
  )))

(defun omake-statement-closes-block-p ()
  (save-excursion
    (beginning-of-line)
    (let (r)
      (cond
       ((setf r (omake-point-command))
        (goto-char (omake--match-begin r :command))
        (looking-at omake--re-block-closing-command))
       (t nil)))))

(defun omake-make-syntax-table ()
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\( "()" st)
    (modify-syntax-entry ?\) ")(" st)
    (modify-syntax-entry ?\[ "(]" st)
    (modify-syntax-entry ?\] ")[" st)
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    ;; '...' and "..." aren't quotes: $'...', $"...", $''..'', etc. are.
    ;; So we handle string syntax using syntax-propertize-function
    (modify-syntax-entry ?\' "." st)
    (modify-syntax-entry ?\" "." st)
    (modify-syntax-entry ?#  "<" st)
    (modify-syntax-entry ?\n ">" st)
    ;; Also handle backslash as escape in syntax-propertize-function
    (modify-syntax-entry ?\\ "." st)
    (modify-syntax-entry ?_  "_" st)
    (modify-syntax-entry ?@  "_" st)
    (modify-syntax-entry ?-  "_" st)
    (modify-syntax-entry ?~  "_" st)
    st))

;;;###autoload
(defvar omake-syntax-table nil
  "Syntax table used in OMake-mode buffers")
(or omake-syntax-table
    (setq omake-syntax-table
          (omake-make-syntax-table)))

(defun omake--set-local (v arg)
  (set (make-local-variable v) arg))

;;;###autoload (add-to-list 'auto-mode-alist '("OMake\\(?:file\\|root\\)$" . omake-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.om$" . omake-mode))

;;;###autoload
(define-derived-mode omake-mode
  nil "OMakefile"
  "A major mode for editing OMake files.
\\{omake-mode-map}"
  :syntax-table omake-syntax-table
  :abbrev-table nil
  (omake--set-local 'comment-start "#")
  (omake--set-local 'comment-end "")
  (omake--set-local 'comment-start-skip "#+\\s-*")
  (omake--set-local 'syntax-propertize-function #'omake-syntax-propertize)
  (omake--set-local 'font-lock-defaults
                    '(#'omake-font-lock-keywords
                      nil nil
                      ((?@ . "w") (?- . "w") (?_ . "w")) nil
                      ))
  (omake--set-local 'indent-line-function #'omake-indent))

(define-key omake-mode-map "\C-j"      'newline-and-indent)
;; indentation level modifiers. Same keys python-mode uses
(define-key omake-mode-map "\C-c\C-l"  'omake-shift-region-left)
(define-key omake-mode-map "\C-c\C-r"  'omake-shift-region-right)
(define-key omake-mode-map "\C-c<"     'omake-shift-region-left)
(define-key omake-mode-map "\C-c>"     'omake-shift-region-right)

(provide 'omake)
;;; omake.el ends here
