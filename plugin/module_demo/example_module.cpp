#include "example_module.h"
#include <iostream>

// 构造函数
#define __class__ "ExampleModule"

namespace ModuleA
{
    int ExampleModule::run()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::pause()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::stop()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::set_para(json)
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    json ExampleModule::get_para()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return json();
    }

}

namespace ModuleB
{

    int ExampleModule::run()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
          return 0;
    }

    int ExampleModule::pause()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
          return 0;
    }

    int ExampleModule::stop()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::set_para(json)
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
          return 0;
    }

    json ExampleModule::get_para()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return json();
    }

    json ExampleModule::get_status()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return json();
    }

}

namespace ModuleC
{

}


namespace ModuleD
{

    int ExampleModule::run()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::pause()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::stop()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    int ExampleModule::set_para(json)
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return 0;
    }

    json ExampleModule::get_para()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return json();
    }

    json ExampleModule::get_status()
    {
        LogInfo("[{}:{}]:function called!", __class__, __func__);
        return json();
    }

}

