; Auto-generated. Do not edit!


(cl:in-package planning2-msg)


;//! \htmlinclude GoToTaskResult.msg.html

(cl:defclass <GoToTaskResult> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GoToTaskResult (<GoToTaskResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToTaskResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToTaskResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name planning2-msg:<GoToTaskResult> is deprecated: use planning2-msg:GoToTaskResult instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToTaskResult>) ostream)
  "Serializes a message object of type '<GoToTaskResult>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToTaskResult>) istream)
  "Deserializes a message object of type '<GoToTaskResult>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToTaskResult>)))
  "Returns string type for a message object of type '<GoToTaskResult>"
  "planning2/GoToTaskResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToTaskResult)))
  "Returns string type for a message object of type 'GoToTaskResult"
  "planning2/GoToTaskResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToTaskResult>)))
  "Returns md5sum for a message object of type '<GoToTaskResult>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToTaskResult)))
  "Returns md5sum for a message object of type 'GoToTaskResult"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToTaskResult>)))
  "Returns full string definition for message of type '<GoToTaskResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToTaskResult)))
  "Returns full string definition for message of type 'GoToTaskResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToTaskResult>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToTaskResult>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToTaskResult
))
