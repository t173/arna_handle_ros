;; Auto-generated. Do not edit!


(when (boundp 'arna_handle::HandleState)
  (if (not (find-package "ARNA_HANDLE"))
    (make-package "ARNA_HANDLE"))
  (shadow 'HandleState (find-package "ARNA_HANDLE")))
(unless (find-package "ARNA_HANDLE::HANDLESTATE")
  (make-package "ARNA_HANDLE::HANDLESTATE"))

(in-package "ROS")
;;//! \htmlinclude HandleState.msg.html


(defclass arna_handle::HandleState
  :super ros::object
  :slots (_left _right ))

(defmethod arna_handle::HandleState
  (:init
   (&key
    ((:left __left) (make-array 8 :initial-element 0.0 :element-type :float))
    ((:right __right) (make-array 8 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _left __left)
   (setq _right __right)
   self)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:serialization-length
   ()
   (+
    ;; float32[8] _left
    (* 4    8)
    ;; float32[8] _right
    (* 4    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[8] _left
     (dotimes (i 8)
       (sys::poke (elt _left i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[8] _right
     (dotimes (i 8)
       (sys::poke (elt _right i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[8] _left
   (dotimes (i (length _left))
     (setf (elt _left i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[8] _right
   (dotimes (i (length _right))
     (setf (elt _right i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get arna_handle::HandleState :md5sum-) "23088a19e1128164dade1d897d8039d0")
(setf (get arna_handle::HandleState :datatype-) "arna_handle/HandleState")
(setf (get arna_handle::HandleState :definition-)
      "# Each handle should have eight sensors, connected to the custom
# Arduino hat as pins A0-A7 (left handle) and pins A8-A15 (right
# handle)
float32[8] left
float32[8] right

")



(provide :arna_handle/HandleState "23088a19e1128164dade1d897d8039d0")


