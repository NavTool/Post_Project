cmake_minimum_required(VERSION 3.21)

project(NavTool)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置 Abseil 的选项
set(ABSL_PROPAGATE_CXX_STD ON CACHE INTERNAL "")

option(FLUENTUI_BUILD_STATIC_LIB "Build FluentUI static library." ON)
option(FLUENTUI_UNIVERSAL_BUILD_MACOS "Universal build FluentUI for macOS." ON)

# # 启用全程序优化和链接时间代码生成
# if(MSVC)
#     add_compile_options(/GL)  # 编译时启用全程序优化
#     add_link_options(/LTCG)   # 链接时启用链接时间代码生成
# endif()

if(APPLE AND FLUENTUI_UNIVERSAL_BUILD_MACOS)
    set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64" CACHE STRING "" FORCE)
else()
    set(FLUENTUI_UNIVERSAL_BUILD_MACOS OFF)
endif()

message("---------------------------- FluentUI ----------------------------")
message("Build FluentUI static library: ${FLUENTUI_BUILD_STATIC_LIB}")
message("Universal build FluentUI for macOS: ${FLUENTUI_UNIVERSAL_BUILD_MACOS}")
message("------------------------------------------------------------------")

option(HOTLOAD_ENABLED "Enable hot reload" OFF)
message("---------------------------- NavTool ----------------------------")
message("Enable hot reload: ${HOTLOAD_ENABLED}")
message("------------------------------------------------------------------")

# 设置默认版本号
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)
set(VERSION_EXTRA 0)


#json
set(JSON_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/rely/json/include")

#spdlog
set(SPDLOG_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/rely/spdlog/include")

add_subdirectory(app)
add_subdirectory(rely/FluentUI-Pro/FluentUI/)
add_subdirectory(rely/rtklib)
add_subdirectory(rely/abseil-cpp)
add_subdirectory(plugin)
add_subdirectory(lib)


#包含的源文件和头文件
include_directories(NavCore ${CMAKE_CURRENT_LIST_DIR}/include)
include_directories(NavCore ${CMAKE_CURRENT_LIST_DIR}/src)
include_directories(NavCore  ${SPDLOG_INCLUDE_PATH})
include_directories(NavCore  ${JSON_INCLUDE_PATH})

#静态库
set(CORE_SOURCES
   include/Project.h
   src/Project.cpp
)
add_library(NavCore STATIC ${CORE_SOURCES})
target_include_directories(NavCore PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

target_link_libraries(NavCore modulebase)



message(STATUS "CMAKE_CXX_FLAGS_DEBUG   : ${CMAKE_CXX_FLAGS_DEBUG}")
message(STATUS "CMAKE_CXX_FLAGS_RELEASE : ${CMAKE_CXX_FLAGS_RELEASE}")
message(STATUS "CMAKE_BUILD_TYPE        : ${CMAKE_BUILD_TYPE}")
 

