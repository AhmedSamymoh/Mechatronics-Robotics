; Auto-generated. Do not edit!


(cl:in-package perception_stack_pkg-msg)


;//! \htmlinclude ObjectSpeed.msg.html

(cl:defclass <ObjectSpeed> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass ObjectSpeed (<ObjectSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name perception_stack_pkg-msg:<ObjectSpeed> is deprecated: use perception_stack_pkg-msg:ObjectSpeed instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ObjectSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:id-val is deprecated.  Use perception_stack_pkg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ObjectSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader perception_stack_pkg-msg:speed-val is deprecated.  Use perception_stack_pkg-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectSpeed>) ostream)
  "Serializes a message object of type '<ObjectSpeed>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectSpeed>) istream)
  "Deserializes a message object of type '<ObjectSpeed>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectSpeed>)))
  "Returns string type for a message object of type '<ObjectSpeed>"
  "perception_stack_pkg/ObjectSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectSpeed)))
  "Returns string type for a message object of type 'ObjectSpeed"
  "perception_stack_pkg/ObjectSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectSpeed>)))
  "Returns md5sum for a message object of type '<ObjectSpeed>"
  "69153bf8feb56938b0d6359bb63bbc1b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectSpeed)))
  "Returns md5sum for a message object of type 'ObjectSpeed"
  "69153bf8feb56938b0d6359bb63bbc1b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectSpeed>)))
  "Returns full string definition for message of type '<ObjectSpeed>"
  (cl:format cl:nil "int32 id~%float32 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectSpeed)))
  "Returns full string definition for message of type 'ObjectSpeed"
  (cl:format cl:nil "int32 id~%float32 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectSpeed>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectSpeed
    (cl:cons ':id (id msg))
    (cl:cons ':speed (speed msg))
))
