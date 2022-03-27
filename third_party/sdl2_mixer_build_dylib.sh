#
# For macOS + Xcode + CMake users.
#
# Ref.: https://github.com/malkia/ufo/blob/master/build/OSX/glfw.sh
#
SDL2_VERSION=6845d9f3cb3f35542f1ec7e74dba6b30bf968959
curl -L https://github.com/libsdl-org/SDL_mixer/archive/$SDL2_VERSION.zip > SDL_mixer-$SDL2_VERSION.zip
unzip SDL_mixer-$SDL2_VERSION.zip
cd SDL_mixer-$SDL2_VERSION/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=12.1
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make

cp -R libSDL2_mixer.dylib ../../../test
