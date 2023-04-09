PROJECT=SDL_mixer
VERSION=db37031ca094059588ba9c33c80b5d827d34fcc1
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
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64;x86_64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
cmake --build .
cmake --install . --prefix ../../../$PROJECT
