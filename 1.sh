#! /bin/bash

clear
cd
dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting ROS Kinetic installer...'  \
   0 0
sleep 1

GAUGE(){
echo $1 | dialog --gauge 'Wait... \n
Installing ROS Kinetic' 0 0 0
}

GAUGE 0
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'  &> /dev/null

GAUGE 2
ssudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116  &> /dev/null

GAUGE 4
sudo apt-get update -y &> /dev/null

GAUGE 9
sudo apt-get install ros-kinetic-desktop-full  -y &> /dev/null

GAUGE 30
sudo rosdep init

GAUGE 31
rosdep update

GAUGE 32
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc 

GAUGE 33
source ~/.bashrc 

GAUGE 34
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y &> /dev/null

GAUGE 55
mkdir -p ~/catkin_ws/src

GAUGE 90
cd catkin_ws

GAUGE 94
catkin_make

GAUGE 96
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

source ~/.bashrc




GAUGE 99
sleep 1

GAUGE 100
sleep 1

dialog                                         \
   --title 'Complete installation.'                           \
   --msgbox '\nROS Kinetic was successfully installed.'  \
   0 0
