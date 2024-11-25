#pragma once
#include <string>
#include <typeinfo>
#include "nlohmann/json.hpp"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

#include "spdlog/fmt/fmt.h"


// 日志宏，支持所有级别
#define LogTrace(...) _logger->trace__VA_ARGS__
#define LogDebug(...) _logger->debug(__VA_ARGS__)
#define LogInfo(...) _logger->info(__VA_ARGS__)
#define LogWarn(...) _logger->warn(__VA_ARGS__)
#define LogError(...) _logger->error(__VA_ARGS__)
#define logCritical(...) _logger->critical(__VA_ARGS__)


using json = nlohmann::json;

// 全局默认日志器
inline std::shared_ptr<spdlog::logger>
    getDefaultModuleLogger()
{
    static auto defaultLogger = spdlog::stdout_color_mt("module_logger");
    return defaultLogger;
}

// 基类：ModuleBase
class ModuleBase
{
private:
    std::string _moduleName;                 // 模块名称

protected:
    std::string _last_errormsg;
    std::shared_ptr<spdlog::logger> _logger; // 模块日志器

public:
    // 构造函数
    explicit ModuleBase(const std::string &name) : _moduleName(name), _logger(getDefaultModuleLogger()) {}
    // 虚析构函数
    virtual ~ModuleBase() = default;
    // 获取模块名称
    const std::string &getModuleName() const { return _moduleName; }
    // 设置日志器
    void setLogger(const std::shared_ptr<spdlog::logger> &externalLogger) { _logger = externalLogger ? externalLogger : getDefaultModuleLogger(); }
    // 获取日志器
    std::shared_ptr<spdlog::logger> getLogger() const { return _logger; }
    // 设置最后的错误信息
    template <typename... Args>
    void addErrorMsg(const char *fmt_str, Args &&...args) { _last_errormsg = fmt::format(fmt_str, std::forward<Args>(args)...); }
    // 获取最后的错误信息
    const std::string &getErrorMsg() const { return _last_errormsg; }

public:
    // 每个继承的子类需要实现的虚函数

           // 控制功能：启动模块
    virtual int run();

           // 控制功能：暂停模块
    virtual int pause();

           // 控制功能：取消暂停
    virtual int unpause();

           // 控制功能：停止模块
    virtual int stop();

           // 控制功能：配置模块参数
    virtual int set_para(json para);

           // 控制功能：配置模块参数
    virtual json get_para();

           // 控制功能：获取参数状态
    virtual json get_status();
};
