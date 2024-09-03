cmake_minimum_required(VERSION 3.20)

project(NavTool VERSION 1.0)


set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core SerialPort)


set(FLUENTUI_QML_PLUGIN_DIRECTORY ${CMAKE_BINARY_DIR}/lib/FluentUI CACHE STRING "force set this option" FORCE)

add_subdirectory(app)
add_subdirectory(lib)


# 默认版本号
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)
set(VERSION_EXTRA 0)

find_package(Git)

if(GIT_FOUND)
    execute_process(
      COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
      OUTPUT_VARIABLE PROJECT_GIT_VERSION
      OUTPUT_STRIP_TRAILING_WHITESPACE
    )
else()
    set(PROJECT_GIT_VERSION "unknown")
endif()

# 使用git describe命令获取标签版本号
execute_process(
    COMMAND git describe --tags --dirty=-dev
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE PROJECT_TAG_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# 检查是否成功获取了标签版本
if(NOT PROJECT_TAG_VERSION)
    message(WARNING "Failed to get Git tag.")
else()
    # 使用正则表达式提取标签中的版本号和更新次数
    string(REGEX MATCH "([0-9]+)\\.([0-9]+)\\.([0-9]+)" VERSION_REGEX "${PROJECT_TAG_VERSION}")
    set(VERSION_MAJOR ${CMAKE_MATCH_1})
    set(VERSION_MINOR ${CMAKE_MATCH_2})
    set(VERSION_PATCH ${CMAKE_MATCH_3})
endif()

# 使用git describe命令获取更新次数
execute_process(
    COMMAND git describe --tags --abbrev=0
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE LATEST_TAG
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

if(NOT LATEST_TAG)
    message(WARNING "Failed to get latest tag.")
else()
    # 使用git describe命令获取距离最近标签的更新次数
    execute_process(
        COMMAND git rev-list ${LATEST_TAG}..HEAD --count
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE UPDATE_COUNT
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(VERSION_EXTRA ${UPDATE_COUNT})
endif()


# 设置项目的版本号
set(PROJECT_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${VERSION_EXTRA}")

set(EXE_NAME "${PROJECT_NAME}-${PROJECT_VERSION}")

message(STATUS "")
message(STATUS "------- ${PROJECT_NAME} -------")

message(STATUS "DEV VERSION: ${PROJECT_VERSION}")
message(STATUS "GIT VERSION: ${PROJECT_GIT_VERSION}")
message(STATUS "TAG VERSION: ${PROJECT_TAG_VERSION}")
message(STATUS "BINARY_NAME: ${EXE_NAME}")

#基于version.h.in 生成 version.h
configure_file(${CMAKE_SOURCE_DIR}/Version.h.in Version.h @ONLY)

