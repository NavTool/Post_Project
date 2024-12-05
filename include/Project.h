#pragma once

#include <unordered_map>
#include <string>
#include <list>
#include "Command.h"
#include "Command_Pattern.h"
#include "ModuleBase.h"

using json = nlohmann::json;

// 初始化全局Project_CPP指针
extern std::shared_ptr<class Project_CPP> g_project;

//标准CPP类，提供工程的所有方法，且完全不依赖Qt,保证后端可以脱离Qt运行
class Project_CPP
{
public:
    Project_CPP(/* args */);
    virtual ~Project_CPP() {}  // 虚析构函数，确保多态性,只要基类有一个虚函数，就能使用 dynamic_pointer_cast，将g_project转换成派生类

           // 返回单例实例
    static std::shared_ptr<Project_CPP> getInstance();

private:
    friend class Command;
    friend class AddStationCmd;

    /* data */
    json _project_info; //站点的基本信息
    std::unordered_map<std::string,json> _station_map;    //key,对象，站点的基本信息
    std::unordered_map<std::string,json> _obsfile_map;    //key，对象，文件的基本信息，文件的路径
    std::unordered_map<std::string,json> _baseline_map;   //key，对象（基站，移动站）
    std::unordered_map<std::string,std::string> _result_map;  //key,结果文件的基本信息，结果文件路径
    std::list<ModuleBase> _task_map;   //任务列表

public:

    int init_project(std::string dir,json projcet_info);//初始化一个工程

    int load_project(std::string project_file); //从文件载入一个工程

    int save_project(std::string project_file);

    int exit_project();

           //工程是否已经保存（执行除保存、另存之外的任何指令，_isModified都会设置为true）
    bool project_is_saved();

           //添加站点
    bool add_new_stations(json stationlist);

           //添加星历
    bool load_nav_files(json navlist);

           //添加观测文件
    bool load_obs_files(json obslist);



           //撤销执行命令
    int undo();
    //重新执行命令
    int redo();

public:


private:
    bool _isModified; // 标记工程是否已修改

    Invoker _invoker;
};






