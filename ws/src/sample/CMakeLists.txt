cmake_minimum_required(VERSION 2.8.3)
project(sample)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS roscpp)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5PrintSupport REQUIRED)
find_package(Qt5Core REQUIRED)
find_package(QCustomPlot)

# include generated header files like ui_mainwindow.h
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# instruct cmake to run moc automatically when needed (process header files)
set(CMAKE_AUTOMOC ON)
# process .ui files
set(CMAKE_AUTOUIC ON)

catkin_package()

include_directories(
    ${Qt5PrintSupport_INCLUDE_DIRS})
    
add_executable(${PROJECT_NAME}_node src/main.cpp src/mainwindow.cpp src/mainwindow.ui)
target_link_libraries(${PROJECT_NAME}_node Qt5::Widgets ${QCustomPlot_LIBRARIES})

install(TARGETS ${PROJECT_NAME}_node
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})