;; Auto-generated. Do not edit!


(when (boundp 'perception_stack_pkg::DetectedObject)
  (if (not (find-package "PERCEPTION_STACK_PKG"))
    (make-package "PERCEPTION_STACK_PKG"))
  (shadow 'DetectedObject (find-package "PERCEPTION_STACK_PKG")))
(unless (find-package "PERCEPTION_STACK_PKG::DETECTEDOBJECT")
  (make-package "PERCEPTION_STACK_PKG::DETECTEDOBJECT"))

(in-package "ROS")
;;//! \htmlinclude DetectedObject.msg.html


(defclass perception_stack_pkg::DetectedObject
  :super ros::object
  :slots (_bbox_x1 _bbox_y1 _bbox_x2 _bbox_y2 _confidence _class_id _class_name ))

(defmethod perception_stack_pkg::DetectedObject
  (:init
   (&key
    ((:bbox_x1 __bbox_x1) 0)
    ((:bbox_y1 __bbox_y1) 0)
    ((:bbox_x2 __bbox_x2) 0)
    ((:bbox_y2 __bbox_y2) 0)
    ((:confidence __confidence) 0.0)
    ((:class_id __class_id) 0)
    ((:class_name __class_name) "")
    )
   (send-super :init)
   (setq _bbox_x1 (round __bbox_x1))
   (setq _bbox_y1 (round __bbox_y1))
   (setq _bbox_x2 (round __bbox_x2))
   (setq _bbox_y2 (round __bbox_y2))
   (setq _confidence (float __confidence))
   (setq _class_id (round __class_id))
   (setq _class_name (string __class_name))
   self)
  (:bbox_x1
   (&optional __bbox_x1)
   (if __bbox_x1 (setq _bbox_x1 __bbox_x1)) _bbox_x1)
  (:bbox_y1
   (&optional __bbox_y1)
   (if __bbox_y1 (setq _bbox_y1 __bbox_y1)) _bbox_y1)
  (:bbox_x2
   (&optional __bbox_x2)
   (if __bbox_x2 (setq _bbox_x2 __bbox_x2)) _bbox_x2)
  (:bbox_y2
   (&optional __bbox_y2)
   (if __bbox_y2 (setq _bbox_y2 __bbox_y2)) _bbox_y2)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:serialization-length
   ()
   (+
    ;; int32 _bbox_x1
    4
    ;; int32 _bbox_y1
    4
    ;; int32 _bbox_x2
    4
    ;; int32 _bbox_y2
    4
    ;; float32 _confidence
    4
    ;; int32 _class_id
    4
    ;; string _class_name
    4 (length _class_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _bbox_x1
       (write-long _bbox_x1 s)
     ;; int32 _bbox_y1
       (write-long _bbox_y1 s)
     ;; int32 _bbox_x2
       (write-long _bbox_x2 s)
     ;; int32 _bbox_y2
       (write-long _bbox_y2 s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _class_id
       (write-long _class_id s)
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _bbox_x1
     (setq _bbox_x1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _bbox_y1
     (setq _bbox_y1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _bbox_x2
     (setq _bbox_x2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _bbox_y2
     (setq _bbox_y2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _class_id
     (setq _class_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get perception_stack_pkg::DetectedObject :md5sum-) "59ad9b3bc0b10f30a1f81dc9d89f08f9")
(setf (get perception_stack_pkg::DetectedObject :datatype-) "perception_stack_pkg/DetectedObject")
(setf (get perception_stack_pkg::DetectedObject :definition-)
      "int32 bbox_x1
int32 bbox_y1
int32 bbox_x2
int32 bbox_y2
float32 confidence
int32 class_id
string class_name
")



(provide :perception_stack_pkg/DetectedObject "59ad9b3bc0b10f30a1f81dc9d89f08f9")


