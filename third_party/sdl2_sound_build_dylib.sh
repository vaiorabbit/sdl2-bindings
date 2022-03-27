#
# For macOS + Xcode + CMake users.
#
# Ref.: https://github.com/malkia/ufo/blob/master/build/OSX/glfw.sh
#
# SDL2_DIR=/opt/homebrew/opt/sdl2
# SDL_VERSION=2.0.1
# curl -L https://github.com/icculus/SDL_sound/archive/refs/tags/v$SDL_VERSION.zip > SDL_sound-$SDL_VERSION.zip
SDL_VERSION=42c4f200c867cc7681b2e9b96057bb9e90355738
curl -L https://github.com/icculus/SDL_sound/archive/$SDL_VERSION.zip > SDL_sound-$SDL_VERSION.zip
unzip SDL_sound-$SDL_VERSION.zip
cd SDL_sound-$SDL_VERSION/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=12.1
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
make

cp -R libSDL2_sound*dylib ../../../test
