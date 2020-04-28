# Avis RoBo | ای ویس ربات

A Telegram AntiSpam RoBot Base On [LuaGram](https://github.com/Luagram/LuagramProject)

# Install Robot | نصب ربات

1️⃣
``` 
Install OpenSSL -- Note : You Need To Be On Root | نصب اپن اس اس ال  -- مهم حتما روی روت نصب شود

Note : sudo -s -- For Go To Root In User Have Sudo Access | دستور سودو اس شمارو وارد روت میکنه

cd /usr/src
wget 'https://www.openssl.org/source/openssl-1.1.1c.tar.gz'
tar -zxf openssl-1.1.1c.tar.gz
cd openssl-1.1.1c
./config
make
make test
make install
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
sudo ldconfig
```
2️⃣
```
Install RoBot It Self

git clone https://github.com/TeleSudo/Avis.git
chmod +x Run.sh
./Run.sh install -- Install
./Run.sh C -- Config
./Run.sh S -- Screen
./Run.sh A -- For AutoLaunch
./Run.sh R -- Run Normal Withou Auto Or Screen !
```

You Need To Add Your Info To Config.lua
شما نیازدارید مشخصات خود را در فایل کانفیگ دات لوا بارگذاری کنید -- Config.lua
