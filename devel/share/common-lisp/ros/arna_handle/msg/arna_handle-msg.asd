
(cl:in-package :asdf)

(defsystem "arna_handle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandleState" :depends-on ("_package_HandleState"))
    (:file "_package_HandleState" :depends-on ("_package"))
  ))