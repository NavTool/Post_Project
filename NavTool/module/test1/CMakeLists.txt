cmake_minimum_required(VERSION 3.5)

project(authverify LANGUAGES CXX)
# project(qpidclient LANGUAGES CXX)

#版本14以下可能会导致abseil不支持
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(MSVC)
    set(CMAKE_CXX_FLAGS_DEBUG "/Zi")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG")
elseif(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS_DEBUG "-g")
endif()

include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/include)
include_directories(${PROJECT_NAME} ${CMAKE_CURRENT_LIST_DIR}/src)

set(SOURCES
    include/Auth_Verify.h
    src/Auth_Verify.cpp
    src/auth_verify_internal.h
    src/auth_verify_internal.cpp
)

add_library(${PROJECT_NAME} STATIC ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
# #libevent 
# target_link_libraries(${PROJECT_NAME} event)
# target_link_libraries(${PROJECT_NAME} event_core)
# target_link_libraries(${PROJECT_NAME} event_extra)



# #nlohmann/json
# include_directories(${PROJECT_NAME} ${JSON_INCLUDE_PATH})

# #spdlog
# add_definitions(-DUSE_SPD_LOG)
# # target_link_libraries(${PROJECT_NAME} spdlog)
# include_directories(${PROJECT_NAME} ${SPDLOG_INCLUDE_PATH})



