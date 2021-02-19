#! /bin/bash

cd
clear

dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting Wheelchair installer...'  \
   0 0
sleep 3

INSTA(){
echo $1 | dialog --gauge 'Wait... \n
Installing Wheelchair packages' 0 0 0
}

INSTA 0
sudo apt-get update -y &> /dev/null
sudo apt-get upgrade -y &> /dev/null
sudo apt-get install ros-kinetic-teleop-twist-keyboard -y &> /dev/null

INSTA 8
cd ~/catkin_ws/src/
git clone https://github.com/ros-perception/slam_gmapping.git


dialog                                         \
   --title 'Wait....'                           \
   --msgbox '\nProceed when the Wheelchair Meshes terminal is finished.'  \
   0 0

#INSTA 98
sudo apt-get update -y &> /dev/null

#INSTA 99
sudo apt-get upgrade -y &> /dev/null

#INSTA 100
sleep 1

dialog                                         \
   --title 'Wait...'                           \
   --infobox '\nStarting Wheelchair download...'  \
   0 0
sleep 3

DOWN(){
echo $1 | dialog --gauge 'Wait... \n
Downloading Wheelchair files' 0 0 0
}

DOWN 0 
cd ~/catkin_ws/src/


DOWN 3
git clone https://github.com/fabioabdon/nuric_wheelchair_model_02.git

DOWN 81
cd
cd
catkin_make &> /dev/null

#DOWN 100
#echo "source ~/nuric_wheelchair_model_02/devel/setup.bash" >> ~/.bashrc
#source ~/.bashrc

dialog                                         \
   --title 'Complete installation.'                           \
   --msgbox '\nWheelchair was successfully installed.'  \
   0 0
