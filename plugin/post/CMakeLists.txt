cmake_minimum_required(VERSION 3.5)

project(post LANGUAGES CXX)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#静态库工程

#包含的源文件和头文件
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/include)
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src)
include_directories(${PROJECT_NAME}  ${SPDLOG_INCLUDE_PATH})
include_directories(${PROJECT_NAME} ${JSON_INCLUDE_PATH})

#静态库
set(POST_LIB_SOURCES
   include/post_processer.h
   src/post_processer.cpp
)

add_library(${PROJECT_NAME} STATIC ${POST_LIB_SOURCES})
target_link_libraries(${PROJECT_NAME} modulebase)
target_link_libraries(${PROJECT_NAME} rtklib)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)



#测试工程

set(TEST_SOURCES
   test/post_demo_main.cpp
)

add_executable(Post_Demo ${TEST_SOURCES})
target_link_libraries(Post_Demo ${PROJECT_NAME})
target_link_libraries(Post_Demo dynamic)









