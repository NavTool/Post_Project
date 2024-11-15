cmake_minimum_required(VERSION 3.21)

project(NavTool)

option(FLUENTUI_BUILD_STATIC_LIB "Build FluentUI static library." ON)
option(FLUENTUI_UNIVERSAL_BUILD_MACOS "Universal build FluentUI for macOS." ON)

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



add_subdirectory(FluentUI-Pro/FluentUI/)
add_subdirectory(NavTool)