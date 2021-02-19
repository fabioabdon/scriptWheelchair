#! /bin/bash

#EXIBE MENU DE ESCOLHA
OPC=$(dialog --menu "ROS + Wheelchair installer: " 0 0 0 \
1 "Install ROS Kinetic" \
2 "Install Wheelchair"	\
3 "Run Wheelchair" 	\
4 "Run Slam-Gmapping" --stdout)

case $OPC in
	1)
	gnome-terminal -- ./1.sh
	./inst.ros.Wheelchair.sh;;

	2)
	gnome-terminal -- ./2.sh
	./inst.ros.Wheelchair.sh;;

	3)
	gnome-terminal -- ./3.sh
	./inst.ros.Wheelchair.sh;;

	4)
	gnome-terminal -- ./4.sh
	./inst.ros.Wheelchair.sh;;


	*)
	clear

esac
