#
# For macOS + Xcode + CMake users.
#
# Ref.: https://github.com/malkia/ufo/blob/master/build/OSX/glfw.sh
#
curl -O https://www.libsdl.org/release/SDL2-2.0.22.zip
unzip SDL2-2.0.22.zip
cd SDL2-2.0.22/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=12.1
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64;arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make

ln -s libSDL2-2.0.dylib libSDL2.dylib
cp -R libSDL2*.dylib ../../../test
