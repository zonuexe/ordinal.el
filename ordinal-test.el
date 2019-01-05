;;; ordinal-test.el --- Unit tests for ordinal package.  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  USAMI Kenta

;; Author: USAMI Kenta <tadsan@zonu.me>
;; Created: 4 Jan 2019
;; Version: 0.0.1
;; Package-Requires: ((emacs "24") (cl-lib "0.5"))
;; Keywords: lisp
;; Homepage: https://github.com/zonuexe/ordinal.el
;; License: GPL-3.0-or-later

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; ## How to Run tests
;;
;; see https://www.gnu.org/software/emacs/manual/html_node/ert/How-to-Run-Tests.html
;;

;;; Code:
(require 'ordinal)
(require 'ert)

(ert-deftest ordinal-test-ordinal-suffix ()
  (dolist (v '((-1 . "th")
               (-2 . "th")
               (-3 . "th")
               (-4 . "th")
               (0  . "th")
               (1  . "st")
               (2  . "nd")
               (3  . "rd")
               (4  . "th")
               (5  . "th")
               (6  . "th")
               (7  . "th")
               (8  . "th")
               (9  . "th")
               (10 . "th")
               (11 . "th")
               (12 . "th")
               (13 . "th")
               (14 . "th")
               (15 . "th")
               (20 . "th")
               (21 . "st")
               (22 . "nd")
               (23 . "rd")
               (24 . "th")
               (99 . "th")
               (100 . "th")
               (101 . "st")
               (102 . "nd")
               (103 . "rd")
               (104 . "th")
               (110 . "th")
               (111 . "th")
               (112 . "th")
               (113 . "th")
               (114 . "th")
               (120 . "th")
               (121 . "st")
               (122 . "nd")
               (123 . "rd")
               (124 . "th")))
    (let ((input (car v))
          (expected (cdr v)))
      (should (string= expected (ordinal-suffix input))))))

(ert-deftest ordinal-test-ordinal-format ()
  (dolist (v '((0  . "0th")
               (1  . "1st")
               (2  . "2nd")
               (3  . "3rd")
               (4  . "4th")
               (5  . "5th")
               (6  . "6th")
               (7  . "7th")
               (8  . "8th")
               (9  . "9th")))
    (let ((ordinal-number-accept-0 t)
          (input (car v))
          (expected (cdr v)))
      (should (string= expected (ordinal-format input))))))

(ert-deftest ordinal-test-ordinal-format-error ()
  (let ((ordinal-number-accept-0 nil))
    (dolist (input '(""
                     0
                     -1
                     ""
                     nil))
      (should-error (ordinal-format input :type 'cl-assertion-failed)))))

(provide 'ordinal-test)
;;; ordinal-test.el ends here
