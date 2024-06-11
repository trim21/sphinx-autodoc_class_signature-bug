sudo apt-get update -y
sudo apt-get install git

git clone --depth=1 https://github.com/qbittorrent/qBittorrent
git clone --depth=1 --recurse-submodules --branch v2.0.10 https://github.com/arvidn/libtorrent.git libtorrent

sudo apt-get update -y
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y build-essential pkg-config automake libtool git zlib1g-dev libssl-dev libgeoip-dev
sudo apt-get install -y libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev
sudo apt-get install -y cmake ninja-build
sudo apt install qt6-base-dev qt6-base-private-dev qt6-tools-dev

pushd libtorrent

cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=Debug -D CMAKE_CXX_COMPILER="ccache" -D CMAKE_C_COMPILER="ccache"
cmake --build build
sudo cmake --install build

popd

cmake -B build -G Ninja -D CMAKE_BUILD_TYPE=Debug -D TESTING=OFF -D QT6=ON -D GUI=OFF  -D CMAKE_CXX_COMPILER="ccache" -D CMAKE_C_COMPILER="ccache"
cmake -B build build