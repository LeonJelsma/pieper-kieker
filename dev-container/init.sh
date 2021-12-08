#s/bin/bash
COLOR='\033[0;32m'
STEP_COUNT=10

echo "${COLOR}Updating packages... (1/${STEP_COUNT})"
apt-get update

echo "${COLOR}Installing sources... (2/${STEP_COUNT})"
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
echo "${COLOR}Succesfully installed sources."

echo "${COLOR}Installing dependencies... (3/${STEP_COUNT})"
apt-get install -y gnupg #apt-get update && apt-get install -y gnupg

echo "${COLOR}Adding keys... (4/${STEP_COUNT})"
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo "${COLOR}Installing ROS... (5/${STEP_COUNT})"
apt-get update
printf "

8\n" | apt install -y ros-melodic-ros-base

echo "${COLOR}Adding ROS to bashrc... (6/${STEP_COUNT})"
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "${COLOR}Added ROS to bashrc."

echo "${COLOR}Restarting bashrc... (7/${STEP_COUNT})"
source ~/.bashrc
echo "${COLOR}Restarted bashrc."

echo "${COLOR}Installing ROS build dependencies... (8/${STEP_COUNT})"
apt-get install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

echo "${COLOR}Initialising ROSdep... (9/${STEP_COUNT})"
rosdep init
echo "${COLOR}Initialised ROSdep."

echo "${COLOR}Updating ROSdep... (10/${STEP_COUNT})"
rosdep update
