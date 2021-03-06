;;; boot.lisp
;;;
;;; Copyright (C) 2006-2011 Peter Graves <gnooth@gmail.com>
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

(cl:eval-when (:compile-toplevel :load-toplevel :execute)
  (sys:%in-package "SYSTEM"))

(setq *load-verbose*     nil)
(setq *autoload-verbose* nil)

(load-system-file "lisp/backquote.lisp")
(load-system-file "lisp/early-macros.lisp")
(load-system-file "lisp/featurep.lisp")
(load-system-file "lisp/read-conditional.lisp")
(load-system-file "lisp/autoloads.lisp")
(load-system-file "lisp/cxr.lisp")
(load-system-file "lisp/make-package.lisp")

;; redefined in define-modify-macro.lisp
(defmacro incf (place &optional (delta 1))
  `(setq ,place (+ ,place ,delta)))

;; redefined in define-modify-macro.lisp
(defmacro decf (place &optional (delta 1))
  `(setq ,place (- ,place ,delta)))

;; redefined in setf.lisp
(defmacro push (item place)
  `(setq ,place (cons ,item ,place)))

;; redefined in precompiler.lisp
(defun ext:precompile (name &optional definition)
  (or name definition))

;; redefined in pprint.lisp
(defun ext:charpos (stream)
  (%stream-charpos stream))

;; redefined in pprint.lisp
(defun (setf ext:charpos) (new-value stream)
  (%stream-set-charpos stream new-value))

(load-system-file "lisp/defmacro.lisp")

(load-system-file "lisp/defconstant.lisp")

(defconstant +nil-symbol-name+ "NIL")
(export '+nil-symbol-name+)

(load-system-file "lisp/defparameter.lisp")

;; (set-symbol-function 'defmacro (macro-function 'defmacro))
;; (set-symbol-plist 'defmacro nil)
;; (set-macro-function 'defmacro (make-macro 'defmacro (symbol-function 'defmacro)))

(let ((x (macro-function 'defmacro)))
  (set-symbol-function 'defmacro x) ; will be overwritten, but clears special operator flag
  (set-symbol-plist 'defmacro nil)
  (set-macro-function 'defmacro x))

;; redefined in loop.lisp
(defmacro loop (&rest exps)
  (let ((tag (gensym)))
    `(block nil (tagbody ,tag ,@exps (go ,tag)))))

;; redefined in restart.lisp
(defun warn (&rest args)
  (format t "WARNING: ~S~%" args))

(%defconstant 'lambda-list-keywords
  '(&optional &rest &key &aux &body &whole &allow-other-keys &environment))

(load-system-file "lisp/inline-expansion.lisp")
(load-system-file "lisp/setf.lisp")
(load-system-file "lisp/compiler-error.lisp")
(load-system-file "lisp/precompiler.lisp")
(load-system-file "lisp/mappend.lisp")
(load-system-file "lisp/member.lisp")

;; needed for reader.lisp
(load-system-file "lisp/make-hash-table.lisp")

;; needed for reader.lisp
(load-system-file "lisp/canonicalize-type.lisp")

;; needed for reader.lisp
(load-system-file "lisp/typep.lisp")

;; needed for reader.lisp
(load-system-file "lisp/apply-key.lisp")
(load-system-file "lisp/find.lisp")

(load-system-file "lisp/reader.lisp")

(load-system-file "lisp/adjoin.lisp")
(load-system-file "lisp/pushnew.lisp")

(load-system-file "lisp/ldb.lisp")
(load-system-file "lisp/typecase.lisp")
(load-system-file "lisp/etypecase.lisp")
(load-system-file "lisp/defknown.lisp")
(load-system-file "lisp/local-variable-information.lisp")
(load-system-file "lisp/instruction.lisp")

(maybe-load-system-file "lisp/ldb.xcl")
(maybe-load-system-file "lisp/defknown.xcl")
(maybe-load-system-file "lisp/local-variable-information.xcl")
(maybe-load-system-file "lisp/instruction.xcl")
(maybe-load-system-file "lisp/inline-expansion.xcl")
(maybe-load-system-file "lisp/setf.xcl")
(maybe-load-system-file "lisp/compiler-error.xcl")
(maybe-load-system-file "lisp/precompiler.xcl")
(maybe-load-system-file "lisp/canonicalize-type.xcl")
(maybe-load-system-file "lisp/typep.xcl")
(maybe-load-system-file "lisp/find.xcl")
(maybe-load-system-file "lisp/defmacro.xcl")
(maybe-load-system-file "lisp/defconstant.xcl")
(maybe-load-system-file "lisp/defparameter.xcl")
(maybe-load-system-file "lisp/backquote.xcl")
(maybe-load-system-file "lisp/featurep.xcl")
(maybe-load-system-file "lisp/read-conditional.xcl")
(maybe-load-system-file "lisp/cxr.xcl")
(maybe-load-system-file "lisp/make-package.xcl")
(maybe-load-system-file "lisp/adjoin.xcl")
(maybe-load-system-file "lisp/pushnew.xcl")
(maybe-load-system-file "lisp/mappend.xcl")
(maybe-load-system-file "lisp/member.xcl")
(maybe-load-system-file "lisp/make-hash-table.xcl")

(maybe-load-system-file "lisp/typecase.xcl")
(maybe-load-system-file "lisp/etypecase.xcl")

(maybe-load-system-file "lisp/early-macros.xcl")
(maybe-load-system-file "lisp/apply-key.xcl")

(maybe-load-system-file "lisp/reader.xcl")

(load-system-file "lisp/invoke-debugger")
;; (load-system-file "lisp/stack")
(load-system-file "lisp/signal")
(load-system-file "lisp/concatenate")

(load-system-file "lisp/require-type")

(load-system-file "lisp/late-setf")

(load-system-file "lisp/define-modify-macro")

(defvar *mumble* nil)
(export '(*mumble* mumble))

(load-system-file "lisp/defvar")
(load-system-file "lisp/defconstant")

(load-system-file "clos/initialize-classes")

(load-system-file "lisp/restart")
(load-system-file "lisp/interactive-eval")
(load-system-file "lisp/top-level")

(load-system-file "lisp/define-compiler-macro")

(make-package "XP" :use '("CL"))

(in-package "XP")

;; redefined in pprint.lisp
(defun xp-structure-p (ignored) nil)

(in-package "SYSTEM")

(load-system-file "lisp/loop")
(load-system-file "lisp/print")
(load-system-file "lisp/defstruct")     ; needed for pprint.xcl
(load-system-file "clos/clos")          ; needed for format.xcl
(load-system-file "lisp/format")        ; needed for pprint.xcl
(load-system-file "lisp/pprint")

(load-system-file "lisp/open")
(load-system-file "lisp/load")

(load-system-file "lisp/epsilons.lisp")

(load-system-file "lisp/stack") ; needs DEFSTRUCT

(load-system-file "lisp/load-initialization-files")
(load-system-file "lisp/process-command-line-arguments")

(load-system-file "lisp/read-line")

(defvar ext:*load-path* nil)

(in-package "CL-USER")

(defun run-ansi-tests (&key (compile-tests t) (mumble t))
;;   (declaim (optimize speed))
  (let* ((ansi-tests-directory
          (pathname (directory-namestring (merge-pathnames "ansi-tests/" *xcl-home*))))
         (*default-pathname-defaults* ansi-tests-directory)
         (*print-structure* t)
         (sys:*mumble* mumble))
    (run-shell-command "make clean")
    (cond (compile-tests
           (load "compileit.lsp"))
          (t
           (load "gclload1.lsp")
           (load "gclload2.lsp")
           (let ((f (find-symbol "DO-TESTS" "RT")))
             (when f
               (eval `(time (funcall ',f)))))))))

;; REVIEW
(when (probe-file (merge-pathnames "lisp/grovel.xcl" *xcl-home*))
  (make-thread #'sys:grovel-cpp-definitions))

(setq sys:*warn-on-redefinition* t)

(unless (member "--noinform" sys:*argv* :test 'equal)
  (format t "Startup completed in ~,2F seconds.~%" (sys:uptime)))

(sys:load-initialization-files)

(sys:process-command-line-arguments)
