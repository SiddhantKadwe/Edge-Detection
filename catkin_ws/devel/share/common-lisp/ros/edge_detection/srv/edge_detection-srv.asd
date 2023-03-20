
(cl:in-package :asdf)

(defsystem "edge_detection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "service" :depends-on ("_package_service"))
    (:file "_package_service" :depends-on ("_package"))
  ))