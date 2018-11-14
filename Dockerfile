FROM ros:kinetic-ros-core

RUN apt update && apt install -y \
    libqcustomplot-dev \
    python-catkin-tools \
    qt5-default

RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

ADD ws /root/ws
CMD /bin/bash -c "cd ~/ws; catkin build; source devel/setup.bash; rosrun sample sample_node"