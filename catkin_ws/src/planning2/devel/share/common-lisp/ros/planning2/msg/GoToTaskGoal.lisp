; Auto-generated. Do not edit!


(cl:in-package planning2-msg)


;//! \htmlinclude GoToTaskGoal.msg.html

(cl:defclass <GoToTaskGoal> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32)))
)

(cl:defclass GoToTaskGoal (<GoToTaskGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToTaskGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToTaskGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name planning2-msg:<GoToTaskGoal> is deprecated: use planning2-msg:GoToTaskGoal instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GoToTaskGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planning2-msg:goal-val is deprecated.  Use planning2-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToTaskGoal>) ostream)
  "Serializes a message object of type '<GoToTaskGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToTaskGoal>) istream)
  "Deserializes a message object of type '<GoToTaskGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToTaskGoal>)))
  "Returns string type for a message object of type '<GoToTaskGoal>"
  "planning2/GoToTaskGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToTaskGoal)))
  "Returns string type for a message object of type 'GoToTaskGoal"
  "planning2/GoToTaskGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToTaskGoal>)))
  "Returns md5sum for a message object of type '<GoToTaskGoal>"
  "db43ffa02e592166bb4af6702f58b8c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToTaskGoal)))
  "Returns md5sum for a message object of type 'GoToTaskGoal"
  "db43ffa02e592166bb4af6702f58b8c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToTaskGoal>)))
  "Returns full string definition for message of type '<GoToTaskGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%geometry_msgs/Point32 goal~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToTaskGoal)))
  "Returns full string definition for message of type 'GoToTaskGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%geometry_msgs/Point32 goal~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToTaskGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToTaskGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToTaskGoal
    (cl:cons ':goal (goal msg))
))
