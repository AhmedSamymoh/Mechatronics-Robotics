;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::ObjectSpeed)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'ObjectSpeed (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::OBJECTSPEED")
  (make-package "PERCEPTION_STACK_PKG::OBJECTSPEED"))

(in-package "ROS")
;;//! \htmlinclude ObjectSpeed.msg.html


(defclass perception_stack_pkg::ObjectSpeed
  :super ros::object
  :slots (_id _speed ))

(defmethod perception_stack_pkg::ObjectSpeed
  (:init
   (&key
    ((:id __id) 0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _speed (float __speed))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get perception_stack_pkg::ObjectSpeed :md5sum-) "69153bf8feb56938b0d6359bb63bbc1b")
(setf (get perception_stack_pkg::ObjectSpeed :datatype-) "perception_stack_pkg/ObjectSpeed")
(setf (get perception_stack_pkg::ObjectSpeed :definition-)
      "int32 id
float32 speed
")



(provide :perception_stack_pkg/ObjectSpeed "69153bf8feb56938b0d6359bb63bbc1b")


