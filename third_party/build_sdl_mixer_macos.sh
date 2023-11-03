PROJECT=SDL_mixer
VERSION=8ab0d03dc4eb1de59fa9a84c1d92e4fbd8fd6757
PREFIX=$PROJECT-$VERSION

mkdir intermediate
curl -L https://github.com/libsdl-org/$PROJECT/archive/$VERSION.zip > intermediate/$PREFIX.zip
cd intermediate
unzip $PREFIX.zip
mv $PREFIX $PROJECT
cd $PROJECT/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=13.1
export SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -D SDL3MIXER_OPUS=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64;x86_64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
cmake --build .
cmake --install . --prefix ../../../$PROJECT
