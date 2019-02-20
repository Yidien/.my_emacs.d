;;; init.el --- ... 
;;
;; Copyright (c) 2019 ...
;; Author: ...
;; URL: ...
;; Version: 0.0.1

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(defvar load-dir (file-name-directory load-file-name)
  "The root dir of the Emacs configuration.")
(defvar themes-load-dir (expand-file-name "themes" load-dir)
  "This directory contains themes of the Emacs.")
(defvar personal-load-dir (expand-file-name "personal" load-dir)
  "This directory is for your personal configuration.")

(defun add-subfolders-to-load-path(parent-dir)
  "Add all level PARENT-DIR subdirs to the 'load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
		 (not (string-prefix-p "." f)))
	(add-to-list 'load-path name)
	(add-subfolders-to-load-path name)))))

;; load path
(add-to-list 'load-path themes-load-dir)
(add-to-list 'load-path personal-load-dir)
(add-subfolders-to-load-path personal-load-dir)

;; load custom theme
(require 'theme)
(require 'personal)
 
;; close start screen(c-h c-a)
;; add new line in the end of file
;; set default directory is "~"
;; close backup files
;; close sounds of error
(setq inhibit-splash-screen t)
(setq require-final-newline t)
(setq default-directory "~/")
(setq make-backup-files nil)
(setq visible-bell t)

;;use y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; add ido (easy to find file if forget)
;; close tool bar
;; close menu bar [F10]
;; close scroll bar
;; show other paren
;; close blink cursor
;; set current line to hight line
;(ido-mode t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(blink-cursor-mode 0)
;(global-hl-line-mode 1)

;; [F9]  calendar
;; [F12] bookmark  (c-x r m :make) (c-x r b :jump) (c-x r l :edit)
(global-set-key [f9] 'calendar)
(global-set-key [f12] 'list-bookmarks)

;; language-configure
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)

;;; init.el end here
