;;; require.lisp
;;;
;;; Copyright (C) 2003-2009 Peter Graves <peter@armedbear.org>
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License
;;; as published by the Free Software Foundation; either version 2
;;; of the License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

(in-package "SYSTEM")

(defparameter *defined-modules* (make-hash-table :test 'equal))

(defun define-module (module-name path)
  (setf (gethash module-name *defined-modules*) path))

(define-module "CLOS"                  "clos/clos")
(define-module "COMPILER"              "compiler/load-compiler")
(define-module "ASSEMBLER"             "compiler/assembler")
(define-module "DUMP-FORM"             "compiler/dump-form")
(define-module "WITH-COMPILATION-UNIT" "compiler/with-compilation-unit")
(define-module "X86"                   "lisp/x86")
(define-module "X86-64"                "lisp/x86-64")
(define-module "ASDF"                  "lisp/asdf")

(defun require (module &optional pathnames)
  (let ((module-name (string module)))
    (unless (member module-name *modules* :test #'string=)
      (let ((saved-modules (copy-list *modules*))
            path)
        (cond (pathnames
               (unless (listp pathnames)
                 (setq pathnames (list pathnames)))
               (dolist (x pathnames)
                 (load x)))
              ((setq path (gethash module-name *defined-modules*))
               (load-system-file path))
              (t
               (load-system-file (concatenate 'string "lisp/" (string-downcase module-name)))))
        (set-difference *modules* saved-modules)))))
