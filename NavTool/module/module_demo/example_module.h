#pragma once
#include <typeinfo>
#include "ModuleBase.h"

// 子类：ExampleModule，继承自 ModuleBase
namespace ModuleA {

    class ExampleModule : public ModuleBase {
    public:
            // 构造函数
        ExampleModule() : ModuleBase(typeid(ExampleModule).name()) {}

        // 控制功能：启动模块
        void run() override;

               // 控制功能：启动模块
        void pause() override;

               // 控制功能：停止模块
        void stop() override;

               // 控制功能：配置模块
        void set_para(json) override;

               // 控制功能：配置模块
        json get_para() override;
    };

}


namespace ModuleB {

    class ExampleModule : public ModuleBase {
    public:
            // 构造函数
        ExampleModule() : ModuleBase(typeid(ExampleModule).name()) {}

               // 控制功能：启动模块
        void run() override;

               // 控制功能：启动模块
        void pause() override;

               // 控制功能：停止模块
        void stop() override;

               // 控制功能：配置模块
        void set_para(json) override;

               // 控制功能：配置模块
        json get_para() override;

               // 控制功能：获取状态
        json get_status() override;
    };

}



namespace ModuleC {

    class ExampleModule : public ModuleBase {
    public:
            // 构造函数
        ExampleModule() : ModuleBase(typeid(ExampleModule).name()) {}

    };

}








