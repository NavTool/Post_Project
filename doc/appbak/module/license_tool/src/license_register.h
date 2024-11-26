#pragma once
#include <string>

#include "aes.h"

class license_register
{
private:
    /* data */
    std::string _svr_public_key;
    std::string _svr_private_key;
    std::string _cli_public_key;
    std::string _cli_private_key;

public:
    license_register(/* args */);
    ~license_register();

    std::string base64_encode(std::string data);
    std::string base64_dncode(std::string data);

    std::string encode_register_data(std::string data); // 加密注册信息
    std::string decode_register_data(std::string data); // 解密注册信息

    std::string encode_license_data(std::string data); // 加密许可证信息
    std::string decode_license_data(std::string data); // 解密许可证信息
};
