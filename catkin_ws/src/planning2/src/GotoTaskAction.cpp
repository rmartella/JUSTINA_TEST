#include <ros/ros.h>

#include <planning2/GoToTaskAction.h>

#include <actionlib/server/simple_action_server.h>
#include <navig_msgs/PathFromMap.h>
#include <justina_tools/JustinaNavigation.h>

#include <common/PointClickSubscriber.h>

class GotoTaskAction {
public:
	GotoTaskAction(std::string name) :
			as(n, name, boost::bind(&GotoTaskAction::executeCallback, this, _1),
					false), action_name(name) {
		cltPathFromAllDijkstra = n.serviceClient<navig_msgs::PathFromMap>(
				"/navigation/localization/path_calculator/voronoi_planner_from_map");
		pointClick = new PointClickSubscriber(&n);
		JustinaNavigation::setNodeHandle(&n);
		as.start();
	}

	virtual ~GotoTaskAction() {
		delete pointClick;
	}

	void executeCallback(const planning2::GoToTaskGoalConstPtr msg) {
			
		std::cout << "executeCallback" << std::endl;
		float start_x, start_y, goal_x, goal_y, currentX, currentY,
				currentTheta;

		if (as.isPreemptRequested() || !ros::ok()) {
			ROS_INFO("%s: Preempted", action_name.c_str());
			as.setPreempted();
			return;
		}

		if (pointClick->getPoint().x == prevInitPoint.x
				&& pointClick->getPoint().y == prevInitPoint.y) {
			JustinaNavigation::getRobotPose(currentX, currentY, currentTheta);
			start_x = currentX;
			start_y = currentY;
		} else {
			start_x = pointClick->getPoint().x;
			start_y = pointClick->getPoint().y;
			prevInitPoint = pointClick->getPoint();
		}
		goal_x = msg->goal.x;
		goal_y = msg->goal.y;

		std::cout << "Execute GotoTaskAction" << std::endl;
		std::cout << "Init (" << start_x << "," << start_y << std::endl;
		std::cout << "End (" << goal_x << "," << goal_y << std::endl;

		navig_msgs::PathFromMap srvPathFromAll;
		srvPathFromAll.request.start_pose.position.x = start_x;
		srvPathFromAll.request.start_pose.position.y = start_y;
		srvPathFromAll.request.goal_pose.position.x = goal_x;
		srvPathFromAll.request.goal_pose.position.y = goal_y;


		ROS_ERROR("Before to calcule path");
		cltPathFromAllDijkstra.call(srvPathFromAll);
		ROS_ERROR("After to calcule path");

		nav_msgs::Path path = srvPathFromAll.response.path;

		JustinaNavigation::startMovePath(path);

		bool success = true, start_is_closely_to_goal = false, init_to_finshed =
				true;
		float tolerance = 0.4;
		ros::Rate rate(10);

		float errorX, errorY, error;

		JustinaNavigation::getRobotPose(currentX, currentY, currentTheta);
		errorX = goal_x - currentX;
		errorY = goal_y - currentY;
		error = sqrt(errorX * errorX + errorY * errorY);
		if (error < tolerance) {
			errorX = goal_x - start_x;
			errorY = goal_y - start_y;
			error = sqrt(errorX * errorX + errorY * errorY);
			if (error < 0.4)
				start_is_closely_to_goal = true;
			else
				init_to_finshed = false;
		}

		ROS_ERROR("Is ros running : %d", ros::ok());
		ROS_ERROR("start_is_closely_to_goal : %d", start_is_closely_to_goal);
		ROS_ERROR("init_to_finshed : %d", init_to_finshed);

		while (ros::ok() && !start_is_closely_to_goal) {

			JustinaNavigation::getRobotPose(currentX, currentY, currentTheta);
			std::cout << "Current Pose (" << currentX << "," << currentY << ")"
					<< std::endl;

			errorX = goal_x - currentX;
			errorY = goal_y - currentY;
			error = sqrt(errorX * errorX + errorY * errorY);

			if (error < 0.4 && init_to_finshed)
				break;
			else {
				errorX = start_x - currentX;
				errorY = start_y - currentY;
				error = sqrt(errorX * errorX + errorY * errorY);
				if (error < 0.4)
					init_to_finshed = true;
			}

			rate.sleep();
			ros::spinOnce();
		}
		if (success) {
			/*result.position.x = pose->getCurrPos().x;
			 result.position.y = pose->getCurrPos().y;
			 result.position.z = 0.0;*/
			ROS_INFO("%s: Succeeded", action_name.c_str());
			//result.status = std_msgs::Bool(true);
			// set the action state to succeeded
			as.setSucceeded(result);
		}
	}

protected:
	ros::NodeHandle n;
	actionlib::SimpleActionServer<planning2::GoToTaskAction> as;
	ros::ServiceClient cltPathFromAllDijkstra;
	std::string action_name;
	planning2::GoToTaskResult result;

	PointClickSubscriber * pointClick;
	geometry_msgs::Point32 prevInitPoint;

};

int main(int argc, char ** argv) {

	ros::init(argc, argv, "path_planning");

	GotoTaskAction gotoTask(ros::this_node::getName());

	ros::spin();

}
