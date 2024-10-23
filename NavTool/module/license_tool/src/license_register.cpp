#include "license_register.h"

license_register::license_register(/* args */)
{
}

license_register::~license_register()
{
}

std::string license_register::base64_encode(std::string data)
{
    return std::string();
}

std::string license_register::base64_dncode(std::string data)
{
    return std::string();
}

std::string license_register::encode_register_data(std::string data)
{
    // 用svr的公钥加密信息
    // input：123456
    // output：abcdef

    //信息生成摘要

    //对摘要进行签名


    return std::string();
}

std::string license_register::decode_register_data(std::string data)
{
    // 用svr的私钥解密信息
    // input：abcdef
    // output：123456

    

    return std::string();
}

std::string license_register::encode_license_data(std::string data)
{
    // 用cli的公钥加密信息
    // input：123456_enable
    // output:qwerty_mnbvcx

    return std::string();
}

std::string license_register::decode_license_data(std::string data)
{
    // 用cli的私钥解密信息
    // input：qwerty_mnbvcx
    // output:123456_enable

    return std::string();
}
