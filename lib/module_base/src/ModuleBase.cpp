#include "ModuleBase.h"


// 暂停处理
int ModuleBase::run()
{
  LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return 0;
}

int ModuleBase::pause()
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return 0;
}

// 继续处理
int ModuleBase::unpause()
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return 0;
}

// 停止处理
int ModuleBase::stop()
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return 0;
}

// 配置参数
int ModuleBase::set_para(json para)
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return 0;
}

// 获取参数
json ModuleBase::get_para()
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return json();
}

// 获取状态
json ModuleBase::get_status()
{
    LogWarn("[{}:{}]:function is not override!", _moduleName, __func__);
    return json();
}
