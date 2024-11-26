cmake_minimum_required(VERSION 3.5)

project(modulebase LANGUAGES CXX)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#包含的源文件和头文件
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/include)
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src)


#静态库
set(BASE_SOURCES
   include/ModuleBase.h
   src/ModuleBase.cpp
)
add_library(${PROJECT_NAME} STATIC ${BASE_SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

#测试例子
set(MAIN_SOURCES
   src/example_module.h
   src/example_module.cpp
   src/main.cpp
)
add_executable(module_demo ${MAIN_SOURCES})
target_link_libraries(module_demo modulebase)


include_directories(${PROJECT_NAME}  ${SPDLOG_INCLUDE_PATH})
include_directories(${PROJECT_NAME}  ${JSON_INCLUDE_PATH})



