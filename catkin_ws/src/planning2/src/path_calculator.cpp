#include <ros/ros.h>

#include "VoronoiPlanner.h"
#include "navig_msgs/PathFromMap.h"

VoronoiPlanner vp;
ros::Publisher voronoi_grid_pub_;
costmap_2d::Costmap2DROS * costmap_ros;

bool callbackVoronoiFromMap(navig_msgs::PathFromMap::Request &req,
		navig_msgs::PathFromMap::Response &resp) {
	ROS_INFO("On executeCb");
	geometry_msgs::PoseStamped start;
	start.pose.position.x = req.start_pose.position.x;
	start.pose.position.y = req.start_pose.position.y;
	start.pose.position.z = req.start_pose.position.z;
	geometry_msgs::PoseStamped goal;
	goal.pose.position.x = req.goal_pose.position.x;
	goal.pose.position.y = req.goal_pose.position.y;
	goal.pose.position.z = req.goal_pose.position.z;

	costmap_2d::Costmap2D * costmap_ = costmap_ros->getCostmap();
	DynamicVoronoi voronoi_;
	std::vector<geometry_msgs::PoseStamped> plan;
	vp.computePlan(costmap_, &voronoi_, start, goal, 0.01, plan);
	nav_msgs::Path path_computed = vp.makePathFromPoses(plan);

	ROS_INFO("Size Plan %d", plan.size());

	vp.publishVoronoiGrid(&voronoi_, costmap_, costmap_ros->getGlobalFrameID(), &voronoi_grid_pub_);

	resp.path = path_computed;

	ROS_ERROR("End executeCb");

	return true;
}

int main(int argc, char ** argv) {

	ros::init(argc, argv, "path_calculator_2");
	ros::NodeHandle n;
	ros::ServiceServer srvPathAStarFromAll = n.advertiseService(
			"path_calculator/voronoi_planner_from_map",
			callbackVoronoiFromMap);

	tf::TransformListener tf(ros::Duration(10));
	costmap_ros = new costmap_2d::Costmap2DROS("global_costmap", tf);
	costmap_ros->pause();
	costmap_ros->start();

	voronoi_grid_pub_ = n.advertise<nav_msgs::OccupancyGrid>("voronoi_grid", 1);
	//motion_path_pub = n.advertise<nav_msgs::Path>(
	//		"/navigation/path_planning/path_calculator/last_calc_path_dijkstra",
	//		1);
	ros::Rate rate(10);

	while (ros::ok()) {
		//motion_path_pub.publish(lastCalcPath);
		ros::spinOnce();
		rate.sleep();
	}
	return 0;

}
