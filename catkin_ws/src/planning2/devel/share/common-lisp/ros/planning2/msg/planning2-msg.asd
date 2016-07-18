
(cl:in-package :asdf)

(defsystem "planning2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GoToTaskFeedback" :depends-on ("_package_GoToTaskFeedback"))
    (:file "_package_GoToTaskFeedback" :depends-on ("_package"))
    (:file "GoToTaskResult" :depends-on ("_package_GoToTaskResult"))
    (:file "_package_GoToTaskResult" :depends-on ("_package"))
    (:file "GoToTaskActionFeedback" :depends-on ("_package_GoToTaskActionFeedback"))
    (:file "_package_GoToTaskActionFeedback" :depends-on ("_package"))
    (:file "GoToTaskActionResult" :depends-on ("_package_GoToTaskActionResult"))
    (:file "_package_GoToTaskActionResult" :depends-on ("_package"))
    (:file "GoToTaskActionGoal" :depends-on ("_package_GoToTaskActionGoal"))
    (:file "_package_GoToTaskActionGoal" :depends-on ("_package"))
    (:file "GoToTaskGoal" :depends-on ("_package_GoToTaskGoal"))
    (:file "_package_GoToTaskGoal" :depends-on ("_package"))
    (:file "GoToTaskAction" :depends-on ("_package_GoToTaskAction"))
    (:file "_package_GoToTaskAction" :depends-on ("_package"))
  ))