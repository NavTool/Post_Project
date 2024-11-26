cmake_minimum_required(VERSION 3.5)

project(post_module LANGUAGES CXX)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#包含的源文件和头文件
# include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/include)
# include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src)

set(MAIN_SOURCES
   post_module.h
   post_module.cpp
   main.cpp
)

add_executable(${PROJECT_NAME} ${MAIN_SOURCES})

target_link_libraries(${PROJECT_NAME} base_module)
target_link_libraries(${PROJECT_NAME} rtklib)

include_directories(${PROJECT_NAME}  ${SPDLOG_INCLUDE_PATH})
include_directories(${PROJECT_NAME}  ${JSON_INCLUDE_PATH})



