#
# For macOS + Xcode + CMake users.
#
SDL2_VERSION="2.0.14"
curl -O https://www.libsdl.org/release/SDL2-$SDL2_VERSION.zip
unzip SDL2-$SDL2_VERSION.zip
cd SDL2-$SDL2_VERSION/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=10.14
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="x86_64;arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make

ln -s libSDL2-2.0.dylib libSDL2.dylib
cp -R libSDL2*.dylib ../../../test
