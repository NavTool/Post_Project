#include <iostream>

#include "example_module.h"
#include <list>
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/sinks/basic_file_sink.h"


//模块调用的例子
int main(int argc, char *argv[])
{

    //创建一个对象
    auto demo1=new ModuleA::ExampleModule() ;
    auto demo2=new ModuleB::ExampleModule() ;
    auto demo3=new ModuleC::ExampleModule() ;
    auto demo4=new ModuleD::ExampleModule() ;

    std::list<ModuleBase*> list;

    list.push_back(demo1);
    list.push_back(demo2);
    list.push_back(demo3);
    list.push_back(demo4);


    for(auto iter:list)
    {
        spdlog::info("MODULE_NAME:{}",iter->getModuleName());
        iter->set_para("xxxxx");
        iter->get_para();
        iter->run();
    }


auto set_logger = spdlog::stderr_color_st("set_logger");
    for(auto iter:list)
    {
         iter->setLogger(set_logger);
        spdlog::info("MODULE_NAME:{}",iter->getModuleName());
        iter->set_para("xxxxx");
        iter->get_para();
        iter->run();
    }

           //子模块，独立功能调用

           //创建一个子模块
    ModuleA::ExampleModule module;


           //设置模块参数
    module.set_para("xxxxxx");

           //获取模块参数
    module.get_para();

           //模块启动（创建一个子线程并执行任务）
    module.run();


           //开始进行循环
    while (0) {
        //读取控制台是否有输入
        if(0)
        {
          //执行暂停，执行继续、执行停止
            module.pause();
        }
        else if(0)
        {
            module.unpause();
        }
        else if(0)
        {
            module.stop();
        }

        module.get_status();
        if(0)
        {
            //判断是否状态是已完成，已经停止，是则跳出循环
            break;
        }
    }

}
