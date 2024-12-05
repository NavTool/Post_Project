#include "Project.h"



// 初始化全局 Project_CPP 指针
std::shared_ptr<class Project_CPP> g_project = nullptr;

std::shared_ptr<Project_CPP> Project_CPP::getInstance() {
    if (!g_project) {
        g_project = std::make_shared<Project_CPP>();
    }
    return g_project;
}

Project_CPP::Project_CPP(/* args */)
{
}

// Project_CPP::~Project_CPP()
// {
// }

bool Project_CPP::add_new_stations(json stationlist)
{


    // auto addStationCmd = std::make_shared<AddStationCmd>(text, ", world!");
    // _history.executeCommand(addStationCmd);

    return true;
}

