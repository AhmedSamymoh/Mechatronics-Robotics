// Generated by gencpp from file perception_stack_pkg/DetectedObjectArray.msg
// DO NOT EDIT!


#ifndef PERCEPTION_STACK_PKG_MESSAGE_DETECTEDOBJECTARRAY_H
#define PERCEPTION_STACK_PKG_MESSAGE_DETECTEDOBJECTARRAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <perception_stack_pkg/DetectedObject.h>

namespace perception_stack_pkg
{
template <class ContainerAllocator>
struct DetectedObjectArray_
{
  typedef DetectedObjectArray_<ContainerAllocator> Type;

  DetectedObjectArray_()
    : header()
    , objects()  {
    }
  DetectedObjectArray_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , objects(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::perception_stack_pkg::DetectedObject_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::perception_stack_pkg::DetectedObject_<ContainerAllocator> >> _objects_type;
  _objects_type objects;





  typedef boost::shared_ptr< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> const> ConstPtr;

}; // struct DetectedObjectArray_

typedef ::perception_stack_pkg::DetectedObjectArray_<std::allocator<void> > DetectedObjectArray;

typedef boost::shared_ptr< ::perception_stack_pkg::DetectedObjectArray > DetectedObjectArrayPtr;
typedef boost::shared_ptr< ::perception_stack_pkg::DetectedObjectArray const> DetectedObjectArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator1> & lhs, const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.objects == rhs.objects;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator1> & lhs, const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace perception_stack_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c10d2ca229c434ab1484b8d5ff6303b5";
  }

  static const char* value(const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc10d2ca229c434abULL;
  static const uint64_t static_value2 = 0x1484b8d5ff6303b5ULL;
};

template<class ContainerAllocator>
struct DataType< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "perception_stack_pkg/DetectedObjectArray";
  }

  static const char* value(const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"DetectedObject[] objects\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: perception_stack_pkg/DetectedObject\n"
"int32 bbox_x1\n"
"int32 bbox_y1\n"
"int32 bbox_x2\n"
"int32 bbox_y2\n"
"float32 confidence\n"
"int32 class_id\n"
"string class_name\n"
;
  }

  static const char* value(const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.objects);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DetectedObjectArray_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::perception_stack_pkg::DetectedObjectArray_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "objects[]" << std::endl;
    for (size_t i = 0; i < v.objects.size(); ++i)
    {
      s << indent << "  objects[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::perception_stack_pkg::DetectedObject_<ContainerAllocator> >::stream(s, indent + "    ", v.objects[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PERCEPTION_STACK_PKG_MESSAGE_DETECTEDOBJECTARRAY_H
