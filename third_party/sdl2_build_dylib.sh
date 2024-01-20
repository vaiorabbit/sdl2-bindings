#
# For macOS + Xcode + CMake users.
#
# Ref.: https://github.com/malkia/ufo/blob/master/build/OSX/glfw.sh
#
curl -L -O https://github.com/libsdl-org/SDL/releases/download/prerelease-2.29.1/SDL2-2.29.1.zip
unzip SDL2-2.29.1.zip
cd SDL2-2.29.1/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=14.0
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64;arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make

ln -s libSDL2-2.0.dylib libSDL2.dylib
cp -R libSDL2*.dylib ../../../test
