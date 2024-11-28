cmake_minimum_required(VERSION 3.21)

project(NavTool)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# -------------------------设置软件基本信息-------------------------------------------------
# 设置可执行程序名称
set(PROJECT_APP_NAME "NavTool")
set(PROJECT_COMPANY "NavTool")
set(PROJECT_COPYRIGHT "Copyright (c) 2024 NavTool's Lab. All rights reserved.")
set(PROJECT_DOMAIN "https://github.com/NavTool/NavTool")
set(PROJECT_DESCRIPTION "A Navigation Tool")

# 设置编构建时间
string(TIMESTAMP PROJECT_BUILD_DATE "%Y-%m-%d")

#----------------------使用git describe命令获取标签版本号 -------------------------------------------
find_package(Git)

if(GIT_FOUND)
    execute_process(
        COMMAND git rev-parse --abbrev-ref HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE PROJECT_GIT_BRANCH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
else()
    set(PROJECT_GIT_BRANCH "unknown")
endif()

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

    execute_process(
        COMMAND git log -1 --format=%cd --date=iso
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE PROJECT_COMMIT_DATE
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
endif()

# 设置项目的版本号
set(PROJECT_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${VERSION_EXTRA}")

# -------------------------获取Qt版本和编译器信息-------------------------------------------------
find_package(Qt6 COMPONENTS Quick QUIET)
if (NOT Qt6_FOUND)
    find_package(Qt5 COMPONENTS Core REQUIRED)
endif()

# 获取并显示 Qt 版本（包括子版本）
if (Qt6Core_VERSION)
    set(QtVersion ${Qt6Core_VERSION})
elseif (Qt5Core_VERSION)
    set(QtVersion ${Qt5Core_VERSION})
else()
    message(FATAL_ERROR "Qt not found")
endif()

# 获取编译器信息
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    if (MINGW)
        set(Compiler "MinGW ${CMAKE_CXX_COMPILER_VERSION}")
    else()
        set(Compiler "GCC ${CMAKE_CXX_COMPILER_VERSION}")
    endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(Compiler "MSVC ${CMAKE_CXX_COMPILER_VERSION}")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(Compiler "Clang ${CMAKE_CXX_COMPILER_VERSION}")
else()
    set(Compiler "${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
endif()
# 获取系统架构
set(Arch ${CMAKE_SYSTEM_PROCESSOR})

# 输出完整的版本信息
set(QT_COMPILER_VERSION "Qt ${QtVersion} (${Compiler}, ${Arch})")

#------------------------------------------------------------------------------

if(WIN32)
    set(APPLICATION_DIR_PATH ${CMAKE_CURRENT_BINARY_DIR})
    set(APP_ICON "${CMAKE_CURRENT_SOURCE_DIR}/favicon/favicon.ico")
elseif(APPLE)
    set(APPLICATION_DIR_PATH ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_APP_NAME}.app/Contents/MacOS)
    set(APP_ICON "${CMAKE_CURRENT_SOURCE_DIR}/favicon/favicon.icns")
else()
    set(APPLICATION_DIR_PATH ${CMAKE_CURRENT_BINARY_DIR})
    set(APP_ICON "${CMAKE_CURRENT_SOURCE_DIR}/favicon/favicon.png")
endif()

set(VERSION_STR "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.${VERSION_EXTRA}")
add_definitions(-DAPP_VERSION=${VERSION_STR})

set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/qt/qml CACHE STRING "" FORCE)

# find_package(Qt6 COMPONENTS Quick WebEngineQuick REQUIRED)
find_package(Qt6 COMPONENTS Quick QuickControls2 REQUIRED)

set(QT_SDK_DIR "${Qt6_DIR}/../../..")
cmake_path(SET QT_SDK_DIR NORMALIZE ${QT_SDK_DIR})

set(QML_FILES
    qml/App.qml
    qml/window/MainWindow.qml
    qml/screen/Screen_Root.qml
    qml/screen/Screen_Init.qml
    qml/screen/Screen_Main.qml
    qml/screen/Screen_File.qml
    qml/component/NavBar_GNSS.qml
    qml/component/NavBar_INS.qml
    qml/component/NavBar_NET.qml
    qml/component/NavBar_Start.qml
    qml/component/NavBar_Support.qml
    qml/component/NavBar_Tool.qml
    qml/component/NavBar_View.qml
    qml/component/SidePage_Blank.qml
    qml/component/SidePage_Layer.qml
    qml/component/SidePage_Log.qml
    qml/component/SidePage_Property.qml
    qml/component/SidePage_Property_Baseline.qml
    qml/component/SidePage_Property_ObsFile.qml
    qml/component/SidePage_Property_Station.qml
    qml/component/SidePage_Resource.qml
    qml/component/SidePage_Status.qml
    qml/page/Page_About.qml
    qml/page/Page_Blank.qml
    qml/page/Page_DataSpan.qml
    qml/page/Page_Home.qml
    qml/page/Page_Map.qml
    qml/page/Page_New.qml
    qml/page/Page_Open.qml
    qml/page/Page_Setting.qml
    qml/page/Page_Start.qml
    qml/page/Page_Table.qml
    qml/page/Page_Table_Baseline.qml
    qml/page/Page_Table_Check.qml
    qml/page/Page_Table_CloseLoop.qml
    qml/page/Page_Table_ObsFile.qml
    qml/page/Page_Table_Option.qml
    qml/page/Page_Table_Station.qml
    qml/page/Page_Task.qml

    # module/plot/Eharts_Plot.qml
    qml/extra/DataGridEx.qml
    qml/extra/ExpanderEx.qml
    qml/extra/TabViewEx.qml

    qml/component/NavBar_Test.qml
)

# qml单例对象
set(QML_SINGLETONS
    qml/Global.qml
)

set(RESOURCES_FILES
    res/logo.png
    res/image/logo.png
    res/image/ic_avatar.jpg
    res/image/ic_spinner.png
    res/image/avatar_1.svg
    res/image/avatar_2.svg
    res/image/avatar_3.svg
    res/image/avatar_4.svg
    res/image/avatar_5.svg
    res/image/avatar_6.svg
    res/image/avatar_7.svg
    res/image/avatar_8.svg
    res/image/avatar_9.svg
    res/image/avatar_10.svg
    res/image/avatar_11.svg
    res/image/avatar_12.svg
    res/image/banner_1.webp
    res/image/banner_2.webp
    res/image/banner_3.webp
    res/image/bg_scenic.webp
    res/image/ic_folder.png
    res/image/ic_file_text.png
    NavTool_zh_CN.qm
    NavTool_en_US.qm
    # module/plot/echarts.js
    # module/plot/echart_dev.html

)
include_directories(${PROJECT_NAME} ${CMAKE_BINARY_DIR})
set(SOURCE_FILES
    src/main.cpp
    src/stdafx.h
    src/frame.hpp
    src/AppInfo.h src/AppInfo.cpp
    src/Log.h src/Log.cpp
    src/CircularReveal.h  src/CircularReveal.cpp
    src/PerformanceMonitor.h  src/PerformanceMonitor.cpp
    src/SettingsHelper.h   src/SettingsHelper.cpp
    src/ResourceDataController.h src/ResourceDataController.cpp
    src/TreeDataGridController.h src/TreeDataGridController.cpp
    src/FileTreeDataController.h src/FileTreeDataController.cpp
    src/DataGridController.h src/DataGridController.cpp
    src/Project_Qt.h src/Project_Qt.cpp
    # module/module.hpp
)

set_source_files_properties(${QML_SINGLETONS} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

if (WIN32)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/win_app.rc.in ${CMAKE_CURRENT_BINARY_DIR}/win_app.rc)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/InstallerScript.iss.in ${CMAKE_SOURCE_DIR}/package/InstallerScript.iss)
    set(APP_ICON_RESOURCE_WINDOWS ${CMAKE_CURRENT_BINARY_DIR}/win_app.rc)
    qt_add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${APP_ICON_RESOURCE_WINDOWS})
elseif(APPLE)
    set(MACOSX_BUNDLE_GUI_IDENTIFIER ${PROJECT_DOMAIN})
    set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
    set(MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR})
    set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECT_APP_NAME})
    set(MACOSX_BUNDLE_COPYRIGHT ${PROJECT_COPYRIGHT})
    set(MACOSX_BUNDLE_DEVELOPMENT_REGION "Chinese")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "Minimum OS X deployment version" FORCE)
    set(MACOSX_BUNDLE_EXECUTABLE_NAME ${PROJECT_APP_NAME})
    set(MACOSX_BUNDLE_ICON_FILE favicon)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/MacOSXBundleInfo.plist.in ${CMAKE_CURRENT_BINARY_DIR}/Info.plist)
    set_source_files_properties(${APP_ICON} PROPERTIES MACOSX_PACKAGE_LOCATION "Resources")
    qt_add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${APP_ICON})
elseif(UNIX)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/linux_control.in ${CMAKE_SOURCE_DIR}/package/DEBIAN/control)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/linux_postinst.in ${CMAKE_SOURCE_DIR}/package/DEBIAN/postinst)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/linux_postrm.in ${CMAKE_SOURCE_DIR}/package/DEBIAN/postrm)
    configure_file(${CMAKE_SOURCE_DIR}/.cmake/linux.desktop.in ${CMAKE_SOURCE_DIR}/package/opt/${PROJECT_APP_NAME}/${PROJECT_APP_NAME}.desktop)
    qt_add_executable(${PROJECT_NAME} ${SOURCE_FILES})
else()
    qt_add_executable(${PROJECT_NAME} ${SOURCE_FILES})
endif()

qt_add_qml_module(${PROJECT_NAME}
    URI "NavTool"
    VERSION "1.0"
    QML_FILES ${QML_FILES} ${QML_SINGLETONS}
    RESOURCES ${RESOURCES_FILES}
    RESOURCE_PREFIX /qt/qml
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qt/qml/NavTool
)

if (NOT CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
    find_program(QT_LUPDATE NAMES lupdate lupdate-qt6)
    find_program(QT_LRELEASE NAMES lrelease lrelease-qt6)
    file(GLOB TS_FILE_PATHS ${CMAKE_CURRENT_LIST_DIR}/ *.ts)
    add_custom_target(${PROJECT_NAME}_translations
        COMMAND ${QT_LUPDATE} ${CMAKE_CURRENT_LIST_DIR} -ts ${PROJECT_NAME}_en_US.ts WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
        COMMAND ${QT_LUPDATE} ${CMAKE_CURRENT_LIST_DIR} -ts ${PROJECT_NAME}_zh_CN.ts WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
        COMMAND ${QT_LRELEASE} ${PROJECT_NAME}_en_US.ts WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
        COMMAND ${QT_LRELEASE} ${PROJECT_NAME}_zh_CN.ts WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
        SOURCES ${TS_FILE_PATHS}
    )
add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}_translations)
endif()

include_directories(${PROJECT_NAME}  ${SPDLOG_INCLUDE_PATH})
include_directories(${PROJECT_NAME}  ${JSON_INCLUDE_PATH})

target_link_libraries(
    ${PROJECT_NAME} PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    # Qt6::WebEngineQuick
    FluentUI
    FluentUIImpl
    FluentUIControls
    NavCore
)
if (FLUENTUI_BUILD_STATIC_LIB)
    target_link_libraries(
        ${PROJECT_NAME} PRIVATE
        FluentUIplugin
        FluentUIImplplugin
        FluentUIControlsplugin
    )
target_compile_definitions(${PROJECT_NAME} PRIVATE
    FLUENTUI_BUILD_STATIC_LIB
)
endif()

target_compile_definitions(${PROJECT_NAME} PRIVATE
    QT_MESSAGELOGCONTEXT
    PROJECT_NAME="${PROJECT_NAME}"
    PROJECT_APP_NAME="${PROJECT_APP_NAME}"
    PROJECT_COMPANY="${PROJECT_COMPANY}"
    PROJECT_DOMAIN="${PROJECT_DOMAIN}"
    PROJECT_DESCRIPTION="${PROJECT_DESCRIPTION}"
    PROJECT_VERSION="${PROJECT_VERSION}"
    PROJECT_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
    PROJECT_HOTLOAD_ENABLED="${HOTLOAD_ENABLED}"
)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_BINARY_DIR}/Info.plist
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    OUTPUT_NAME ${PROJECT_APP_NAME}
)

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

set(DIST_PATH ${CMAKE_SOURCE_DIR}/dist)

file(WRITE ${CMAKE_BINARY_DIR}/remove_build_files.cmake
    "file(GLOB_RECURSE REMOVE_FILES
        \"${DIST_PATH}/*.qml\"
        \"${DIST_PATH}/*.debug\"
        \"${DIST_PATH}/*opengl32sw*\"
        \"${DIST_PATH}/*dxcompiler*\"
        \"${DIST_PATH}/*d3dcompiler_47*\"
        \"${DIST_PATH}/*vc_redist*\"
        \"${DIST_PATH}/*dxil*\"
        \"${DIST_PATH}/*Qt6Pdf*\"
        \"${DIST_PATH}/*Qt6VirtualKeyboard*\"
        \"${DIST_PATH}/*Qt6QuickControls2ImagineStyleImpl*\"
        \"${DIST_PATH}/*Qt6QuickControls2Universal*\"
        \"${DIST_PATH}/*Qt6QuickControls2UniversalStyleImpl*\"
        \"${DIST_PATH}/*Qt6QuickControls2WindowsStyleImpl*\"
        \"${DIST_PATH}/*Qt6QuickControls2Fusion*\"
        \"${DIST_PATH}/*Qt6QuickControls2FusionStyleImpl*\"
        \"${DIST_PATH}/*Qt6QuickControls2Imagine*\"
        \"${DIST_PATH}/*Qt6Quick3DUtils*\"
        \"${DIST_PATH}/*Qt63DAnimation*\"
        \"${DIST_PATH}/*Qt63DCore*\"
        \"${DIST_PATH}/*Qt63DExtras*\"
        \"${DIST_PATH}/*Qt63DInput*\"
        \"${DIST_PATH}/*Qt63DLogic*\"
        \"${DIST_PATH}/*Qt63DQuickScene2D*\"
        \"${DIST_PATH}/*Qt63DRender*\"
    )
    file(REMOVE \${REMOVE_FILES})
    "
)

if (CMAKE_BUILD_TYPE MATCHES "Release")
    if(WIN32)
        find_program(QT_DEPLOY NAMES windeployqt)
        if (MSVC)
            file(GLOB_RECURSE RUNTIME_FILE_PATHS ./runtime/msvc/*.dll)
        elseif (MINGW)
            file(GLOB_RECURSE RUNTIME_FILE_PATHS ./runtime/mingw/*.dll)
        endif ()
    add_custom_target(${PROJECT_NAME}_dist
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${DIST_PATH}
        COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_APP_NAME}.exe ${DIST_PATH}/${PROJECT_APP_NAME}.exe
        COMMAND ${QT_DEPLOY} --qmldir=${CMAKE_SOURCE_DIR} --plugindir ${DIST_PATH}/plugins --no-translations --compiler-runtime ${DIST_PATH}/${PROJECT_APP_NAME}.exe
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_BINARY_DIR}/remove_build_files.cmake
        COMMAND ${CMAKE_COMMAND} -E copy ${RUNTIME_FILE_PATHS} ${DIST_PATH}
        COMMENT "Windows Deploying Qt Dependencies After Build........."
        SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
endif()
if (APPLE)
    find_program(QT_DEPLOY NAMES macdeployqt)
    add_custom_target(${PROJECT_NAME}_dist
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${DIST_PATH}
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_APP_NAME}.app ${DIST_PATH}/${PROJECT_APP_NAME}.app
        COMMAND ${QT_DEPLOY} ${DIST_PATH}/${PROJECT_APP_NAME}.app -qmldir=${CMAKE_SOURCE_DIR}
        COMMAND find ${DIST_PATH}/${PROJECT_APP_NAME}.app -name "*.dSYM" | xargs rm -r
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_BINARY_DIR}/remove_build_files.cmake
        COMMAND ${QT_DEPLOY} ${DIST_PATH}/${PROJECT_APP_NAME}.app -dmg
        COMMENT "MacOs Deploying Qt Dependencies After Build........."
        SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
endif()
if (LINUX)
    set(LINUXDEPLOY_URL "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage")
    set(LINUXDEPLOY_DEST "${CMAKE_BINARY_DIR}/linuxdeploy")
    if(NOT EXISTS ${LINUXDEPLOY_DEST})
        file(DOWNLOAD ${LINUXDEPLOY_URL} ${LINUXDEPLOY_DEST} SHOW_PROGRESS)
        if(UNIX)
            execute_process(COMMAND chmod +x ${LINUXDEPLOY_DEST})
        endif()
        message(STATUS "Downloaded linuxdeploy to: ${LINUXDEPLOY_DEST}")
    else()
        message(STATUS "linuxdeploy already exists at: ${LINUXDEPLOY_DEST}")
    endif()
    find_program(QT_DEPLOY NAMES linuxdeploy PATHS ${CMAKE_BINARY_DIR})
    add_custom_target(${PROJECT_NAME}_dist
        COMMAND ${CMAKE_COMMAND} -E remove_directory ${DIST_PATH}
        COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_APP_NAME} ${DIST_PATH}/${PROJECT_APP_NAME}
        COMMAND ${CMAKE_COMMAND} -E copy ${APP_ICON} ${DIST_PATH}/${PROJECT_APP_NAME}.png
        COMMAND ${CMAKE_COMMAND} -E env PATH=${QT_SDK_DIR}/bin:$ENV{PATH} ${QT_DEPLOY} ${DIST_PATH}/${PROJECT_APP_NAME} -qmldir=${CMAKE_SOURCE_DIR} -unsupported-allow-new-glibc
        COMMAND ${CMAKE_COMMAND} -P ${CMAKE_BINARY_DIR}/remove_build_files.cmake
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${DIST_PATH} ${CMAKE_SOURCE_DIR}/package/opt/${PROJECT_APP_NAME}
        COMMAND chmod 775 ${CMAKE_SOURCE_DIR}/package/DEBIAN/postinst
        COMMAND chmod 775 ${CMAKE_SOURCE_DIR}/package/DEBIAN/postrm
        COMMENT "LINUX Deploying Qt Dependencies After Build........."
        SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
endif()
endif()


# -------------------------输出软件的定义-------------------------------------------------
message(STATUS "")
message(STATUS "---------------- ${PROJECT_NAME} ----------------------")
message(STATUS "PROJECT_NAME          : ${PROJECT_NAME}")
message(STATUS "PROJECT_VERSION       : ${PROJECT_VERSION}")
message(STATUS "PROJECT_GIT_BRANCH    : ${PROJECT_GIT_BRANCH}")
message(STATUS "PROJECT_GIT_VERSION   : ${PROJECT_GIT_VERSION}")
message(STATUS "PROJECT_TAG_VERSION   : ${PROJECT_TAG_VERSION}")
message(STATUS "PROJECT_COMMIT_DATE   : ${PROJECT_COMMIT_DATE}")
message(STATUS "")
message(STATUS "CMAKE_SYSTEM          : ${CMAKE_SYSTEM}")
message(STATUS "CMAKE_SYSTEM_PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "CMAKE_BUILD_TYPE      : ${CMAKE_BUILD_TYPE}")
message(STATUS "PROJECT_BUILD_DATE    : ${PROJECT_BUILD_DATE}")
message(STATUS "QT_COMPILER_VERSION   : ${QT_COMPILER_VERSION}")
message(STATUS "")
message(STATUS "PROJECT_APP_NAME      : ${PROJECT_APP_NAME}")
message(STATUS "PROJECT_COMPANY       : ${PROJECT_COMPANY}")
message(STATUS "PROJECT_COPYRIGHT     : ${PROJECT_COPYRIGHT}")
message(STATUS "PROJECT_DOMAIN        : ${PROJECT_DOMAIN}")
message(STATUS "PROJECT_DESCRIPTION   : ${PROJECT_DESCRIPTION}")
message(STATUS "")




#设定version.h中的具体信息


#基于version.h.in 生成 version.h
configure_file(${CMAKE_SOURCE_DIR}/Version.h.in Version.h @ONLY)
