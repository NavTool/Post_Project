#!/bin/sh 
export QT_DIR=/home/koro/Qt/6.7.2/gcc_64
export PATH=${QT_DIR}/bin:$PATH
export LIB_PATH=${QT_DIR}/lib:$LIB_PATH
export PLUGIN_PATH=${QT_DIR}/plugins:$PLUGIN_PATH
export QML2_PATH=${QT_DIR}/qml:$QML2_PATH
export LD_LIBRARY_PATH=${QT_DIR}/lib:$LD_LIBRARY_PATH 
export QT_PLUGIN_PATH=${QT_DIR}/plugins:$PLUGIN_PATH 
#export QMAKE=/home/koro/Qt/6.7.2/gcc_64/bin/qmake

#linuxdeploy
export QML_SOURCES_PATHS=./

echo $PATH 
echo $LIB_PATH
echo $PLUGIN_PATH
echo $QML2_PATH 
echo $LD_LIBRARY_PATH 
echo $QT_PLUGIN_PATH 
echo $QML_SOURCES_PATHS
#echo $QMAKE



#export QML2_PATH=${QT_DIR}/qml:$QML2_PATH 
#export CMAKE_PREFIX_PATH=${QT_DIR}

# echo $CMAKE_PREFIX_PATH

#./linuxdeploy-aarch64.AppImage --plugin=qt --output=appimage --create-desktop-file --icon-file=example.svg --executable=bin/Release/example --appdir bin/release/


#1 set path
# source path.sh
#2 pack appimage
# ./linuxdeploy-aarch64.AppImage --plugin=qt --output=appimage --create-desktop-file --icon-file=/FluentUI-1.7.7/example.svg --executable=FluentUI-1.7.7/bin/Debug/example --appdir /FluentUI-1.7.7/bin/0819/

#./linuxdeploy-aarch64.AppImage --plugin=qt --output=appimage --create-desktop-file --icon-file=example.svg --executable=bin/Release/example --appdir bin/0819-2/


#./linuxdeploy-aarch64.AppImage --plugin=qt --output=appimage --create-desktop-file --icon-file=CS_GUI.svg --executable=bin/Release/CS_GUI --appdir bin/0828/


# Run Env

#export QMLSCENE_DEVICE=softwarecontext
#export LIBGL_ALWAYS_INDIRECT=y


