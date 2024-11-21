#include "example_module.h".h"
#include <iostream>

// 构造函数
#define __class__ "ExampleModule"

namespace ModuleA {

    void ExampleModule::run()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::pause()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::stop()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::set_para(json)
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    json ExampleModule::get_para()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
        return json();
    }

}

namespace ModuleB {

    void ExampleModule::run()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::pause()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::stop()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    void ExampleModule::set_para(json)
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
    }

    json ExampleModule::get_para()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
        return json();
    }

    json ExampleModule::get_status()
    {
        std::cout <<"["<< typeid(ExampleModule).name() <<"]:["<<__func__ <<"] called!"<< std::endl;
        return json();
    }

}

namespace ModuleC {



}


