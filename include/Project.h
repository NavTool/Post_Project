#pragma once

#include "nlohmann/json.hpp"

#include <unordered_map>
#include <string>
#include <list>
#include "ModuleBase.h"


using json = nlohmann::json;

//标准CPP类，提供工程的所有方法，且完全不依赖Qt,保证后端可以脱离Qt运行
class Project_CPP
{
private:
    /* data */
    json _project_info; //站点的基本信息
    std::unordered_map<std::string,json> _station_map;    //key,对象，站点的基本信息
    std::unordered_map<std::string,json> _obsfile_map;    //key，对象，文件的基本信息，文件的路径
    std::unordered_map<std::string,json> _baseline_map;   //key，对象（基站，移动站）

    std::unordered_map<std::string,std::string> _result_map;  //key,结果文件的基本信息，结果文件路径

    std::list<ModuleBase> _task_map;   //任务列表


public:
    Project_CPP(/* args */);
    ~Project_CPP();

    int load();
    int save();
    int save_as();
    int exit();

    //管理站点的任务

    //生成基线

    //创建任务
    //导入（解析）文件的任务

    //


public:
    


};






