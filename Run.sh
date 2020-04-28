install() {
sudo apt update
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo ap install lua5.3
sudo apt install g++-4.7 c++-4.7
sudo apt install gcc-4.9
sudo apt upgrade libstdc++6
sudo apt install libreadline-dev libconfig-dev libssl-dev lua5.3 liblua5.3-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
sudo apt install screen
sudo apt install libnotify-dev
sudo apt install libconfig++9v5 libstdc++6
sudo apt install libconfig++8-dev
sudo apt install lua-lgi
sudo apt install build-essential checkinstall zlib1g-dev -y
cd /usr/local/src/
sudo wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz
sudo tar -xf openssl-1.1.1c.tar.gz
cd openssl-1.1.1c
sudo ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
sudo make
sudo make test
sudo make install
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
sudo ldconfig
}

C(){
git clone https://github.com/luagram/LuagramProject.git
cd Luagram*
sudo lua5.3 setup.lua
}

A () {
while true;do
sudo lua5.3 bot.lua
sleep 1
done
}

R () {
sudo lua5.3 bot.lua
}

S () {
sudo screen lua5.3 bot.lua
} 