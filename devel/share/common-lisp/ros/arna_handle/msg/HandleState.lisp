; Auto-generated. Do not edit!


(cl:in-package arna_handle-msg)


;//! \htmlinclude HandleState.msg.html

(cl:defclass <HandleState> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0))
   (right
    :reader right
    :initarg :right
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass HandleState (<HandleState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandleState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandleState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arna_handle-msg:<HandleState> is deprecated: use arna_handle-msg:HandleState instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <HandleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arna_handle-msg:left-val is deprecated.  Use arna_handle-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <HandleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arna_handle-msg:right-val is deprecated.  Use arna_handle-msg:right instead.")
  (right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandleState>) ostream)
  "Serializes a message object of type '<HandleState>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'left))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'right))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandleState>) istream)
  "Deserializes a message object of type '<HandleState>"
  (cl:setf (cl:slot-value msg 'left) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'left)))
    (cl:dotimes (i 8)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'right) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'right)))
    (cl:dotimes (i 8)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandleState>)))
  "Returns string type for a message object of type '<HandleState>"
  "arna_handle/HandleState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandleState)))
  "Returns string type for a message object of type 'HandleState"
  "arna_handle/HandleState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandleState>)))
  "Returns md5sum for a message object of type '<HandleState>"
  "23088a19e1128164dade1d897d8039d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandleState)))
  "Returns md5sum for a message object of type 'HandleState"
  "23088a19e1128164dade1d897d8039d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandleState>)))
  "Returns full string definition for message of type '<HandleState>"
  (cl:format cl:nil "# Each handle should have eight sensors, connected to the custom~%# Arduino hat as pins A0-A7 (left handle) and pins A8-A15 (right~%# handle)~%float32[8] left~%float32[8] right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandleState)))
  "Returns full string definition for message of type 'HandleState"
  (cl:format cl:nil "# Each handle should have eight sensors, connected to the custom~%# Arduino hat as pins A0-A7 (left handle) and pins A8-A15 (right~%# handle)~%float32[8] left~%float32[8] right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandleState>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'left) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'right) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandleState>))
  "Converts a ROS message object to a list"
  (cl:list 'HandleState
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
))
