#!/bin/bash
echo "What can I do for you ?!
1) Install Bot          2) Config Bot
3) Start Auto Launch    4) Normal Launch
5) Normal Launch (with screen)
Input your choice number : "
read Choice
case $Choice in
    1)
        echo -e "\e[1m\e[32m==> \e[97m Starting Installation... \e[0m"
        sleep 2
        sudo apt update
        sudo add-apt-repository ppa:ubuntu-toolchain-r/test
        sudo apt upgrade
        sudo apt install lua5.3
        sudo apt install zip
        sudo apt install build-essential checkinstall zlib1g-dev -y
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
        mkdir tmp
        cd tmp
        git clone https://github.com/george0884/lua-curl-error && cd lua-curl-error && tar -xzvf curl.tar.gz && sudo cp curl -r /usr/include/ && cd .. && sudo rm -Rf lua-curl-error
        wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz --no-check-certificate
        tar zxpf luarocks-2.2.2.tar.gz
        cd luarocks-2.2.2
        ./configure; sudo make bootstrap
        sudo luarocks install luasec
        sudo luarocks install luasocket
        sudo luarocks install redis-lua
        sudo luarocks install lua-term
        sudo luarocks install serpent
        sudo luarocks install dkjson
        sudo luarocks install Lua-cURL
        cd ../..
        rm -rf tmp
    ;;
    2)
        echo -e "\e[1m\e[32m==> \e[97m Starting Configuration... \e[0m"
        sleep 2
        git clone https://github.com/luagram/LuagramProject.git
        cd Luagram*
        sudo lua5.3 setup.lua
    ;;
    3)
        echo -e "\e[1m\e[32m==> \e[97m Starting Auto Launch Mode... \e[0m"
        sleep 2
        while true;do
        sudo lua5.3 bot.lua
        sleep 1
        done
    ;;
    4)
        echo -e "\e[1m\e[32m==> \e[97m Starting Basic Launch Mode... \e[0m"
        sleep 2
        sudo lua5.3 bot.lua
    ;;
    5)
        echo -e "\e[1m\e[32m==> \e[97m Starting Basic Launch Mode using Screen... \e[0m"
        sleep 2
        sudo screen lua5.3 bot.lua
    ;;
esac
