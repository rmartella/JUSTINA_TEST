#include <ros/ros.h>

#include "navig_msgs/PathFromAll.h"

int main(int argc, char ** argv) {

	ros::init(argc, argv, "path_calculator_test");
	ros::NodeHandle n;

	if (argc != 5) {
		ROS_INFO("usage: MotionPlanning start_x, start_y, goal_x, goal_y");
		return 1;
	}

	ros::ServiceClient cltPathFromAllDijkstra = n.serviceClient<
			navig_msgs::PathFromAll>("path_calculator/dijkstra_from_all");

	navig_msgs::PathFromAll srvPathFromAll;
	srvPathFromAll.request.start_pose.position.x = atof(argv[1]);
	srvPathFromAll.request.start_pose.position.y = atof(argv[2]);
	srvPathFromAll.request.goal_pose.position.x = atof(argv[3]);
	srvPathFromAll.request.goal_pose.position.y = atof(argv[4]);

	cltPathFromAllDijkstra.call(srvPathFromAll);

	return 0;

}
