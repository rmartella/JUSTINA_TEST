cmake_minimum_required(VERSION 2.8.3)
project(planning2)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  nav_msgs
  std_msgs
  geometry_msgs
  actionlib_msgs
  visualization_msgs
  tf
  tf_conversions
  dynamicvoronoi
  costmap_2d
  navig_msgs
  justina_tools
  common
)

SET(CMAKE_CXX_FLAGS "-frounding-math -std=c++11")

add_action_files(
        DIRECTORY action
        FILES GoToTask.action
)

generate_messages(
    DEPENDENCIES
    actionlib_msgs std_msgs geometry_msgs
)

catkin_package(
        CATKIN_DEPENDS message_runtime actionlib_msgs
)
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${dynamicvoronoi_INCLUDE_DIRS}
  ${common_INCLUDE_DIRS}
)

add_executable(GotoTaskAction2 src/GotoTaskAction.cpp)
target_link_libraries(GotoTaskAction2 ${catkin_LIBRARIES} )
add_dependencies(
  GotoTaskAction2
  ${planning2_EXPORTED_TARGETS}
)

add_executable(path_calculator 
  src/path_calculator.cpp
  src/VoronoiPlanner.cpp
)
add_dependencies(path_calculator ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(path_calculator ${catkin_LIBRARIES} )

add_executable(path_calculator_test src/path_calculator_test.cpp)
target_link_libraries(path_calculator_test ${catkin_LIBRARIES} )
