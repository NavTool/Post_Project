#pragma once

#include "ModuleBase.h"


class Post_Processer :protected ModuleBase
{
public:

    Post_Processer() : ModuleBase(typeid(Post_Processer).name()){}

    int run() override;

    int pause() override;

    int stop() override;

    int set_para(json) override;

    json get_para() override;

};
