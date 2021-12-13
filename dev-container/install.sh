#!/bin/bash

# This file must have LF as line endings otherwise Docker will not
#   be able to run it and it will result in a file not found error.

function ProgressBar {
    # Process data.
	let _progress=(${1}*100/${2}*100)/100
	let _done=(${_progress}*4)/10
	let _left=40-$_done

    # Build progressbar string lengths.
	_done=$(printf "%${_done}s")
	_left=$(printf "%${_left}s")

    # Output progress.
    printf "\r${COLOR}Progress : [${_done// /#}${_left// /-}] ${_progress}%%"
}

COLOR='\033[0;32m'
STEP_COUNT=14

ProgressBar 0 ${STEP_COUNT}

ln -snf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && echo Europe/Amsterdam > /etc/timezone
ProgressBar 1 ${STEP_COUNT}

apt-get -qq update
ProgressBar 2 ${STEP_COUNT}

apt-get -qq upgrade
ProgressBar 3 ${STEP_COUNT}

apt-get -qq install -y apt-utils > /dev/null
ProgressBar 4 ${STEP_COUNT}

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
ProgressBar 5 ${STEP_COUNT}

apt-get -qq install -y gnupg > /dev/null
ProgressBar 6 ${STEP_COUNT}

apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
ProgressBar 7 ${STEP_COUNT}

apt-get -qq update
ProgressBar 8 ${STEP_COUNT}

# #echo -ne "8\015" | apt-get -qq install -y ros-melodic-ros-base > /dev/null
apt-get -qq install -y ros-melodic-ros-base > /dev/null
ProgressBar 9 ${STEP_COUNT}

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
ProgressBar 10 ${STEP_COUNT}

source ~/.bashrc
ProgressBar 11 ${STEP_COUNT}

apt-get -qq install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential > /dev/null
ProgressBar 12 ${STEP_COUNT}

rosdep init
ProgressBar 13 ${STEP_COUNT}

rosdep update
ProgressBar 14 ${STEP_COUNT}
