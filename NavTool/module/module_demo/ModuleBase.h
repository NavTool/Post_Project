#pragma once

#include <functional>
#include <string>

using json=std::string;

// 基类：ModuleBase
class ModuleBase {
private:
    std::string moduleName;

public:
    // 构造函数，初始化模块名称
    ModuleBase(const std::string& name) : moduleName(name) {}

           // 获取模块名称
    const std::string& getModuleName() const;

           // 虚析构函数
    virtual ~ModuleBase();

           // 控制功能：启动模块
    virtual void run();

           // 控制功能：暂停模块
    virtual void pause();

           // 控制功能：取消暂停
    virtual void unpause();

           // 控制功能：停止模块
    virtual void stop();

           // 控制功能：配置模块参数
    virtual void set_para(json);

           // 控制功能：配置模块参数
    virtual json get_para();

           // 控制功能：获取参数状态
    virtual json get_status();


};


