# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "app\\CMakeFiles\\NavTool_autogen.dir\\AutogenUsed.txt"
  "app\\CMakeFiles\\NavTool_autogen.dir\\ParseCache.txt"
  "app\\NavTool_autogen"
  "app\\rcc_object_qml_autogen"
  "lib\\FluentUI\\CMakeFiles\\fluentuiplugin_autogen.dir\\AutogenUsed.txt"
  "lib\\FluentUI\\CMakeFiles\\fluentuiplugin_autogen.dir\\ParseCache.txt"
  "lib\\FluentUI\\fluentuiplugin_autogen"
  )
endif()
