PROJECT=SDL
VERSION=87e916dd214866af9cfd67eb4618918bc8b0f1b4
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
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64;x86_64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang ../
cmake --build .
cmake --install . --prefix ../../../$PROJECT
