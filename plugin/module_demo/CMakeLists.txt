cmake_minimum_required(VERSION 3.5)

project(demo_module_base LANGUAGES CXX)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#包含的源文件和头文件
# include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/include)
# include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src)

set(MAIN_SOURCES
   ModuleBase.h
   ModuleBase.cpp
   example_module.h
   example_module.cpp
   main.cpp
)

set(BASE_SOURCES
   ModuleBase.h
   ModuleBase.cpp
)

add_executable(${PROJECT_NAME} ${MAIN_SOURCES})

add_library(base_module STATIC ${BASE_SOURCES})

include_directories(${PROJECT_NAME}  ${SPDLOG_INCLUDE_PATH})
include_directories(${PROJECT_NAME}  ${JSON_INCLUDE_PATH})



