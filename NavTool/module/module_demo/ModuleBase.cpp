#include "ModuleBase.h"
#include <iostream>

// 虚析构函数
ModuleBase::~ModuleBase() {}

// 获取模块名称
const std::string& ModuleBase::getModuleName() const {
    return moduleName;
}

// 启动处理
void ModuleBase::run() {
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
}

// 暂停处理
void ModuleBase::pause() {
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
}

// 继续处理
void ModuleBase::unpause(){
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
}

// 停止处理
void ModuleBase::stop() {
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
}

//配置参数
void ModuleBase::set_para(json){
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
}

//获取参数
json ModuleBase::get_para(){
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
    return json();
}

//获取状态
json ModuleBase::get_status(){
    std::cout <<"["<< moduleName <<"]:["<<__func__ <<"] is not override!"<< std::endl;
    return json();
}


