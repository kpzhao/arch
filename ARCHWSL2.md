# 安装ARCHWSL2
在[yuk7/ArchWSL - releases](https://github.com/yuk7/ArchWSL/releases/tag/21.8.28.0)下载`Arch.zip`，解压，双击`Arch.exe`进行安装。详见[yuk7/ArchWSL - Wiki](https://github.com/yuk7/ArchWSL)
## clash 代理

```
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
export https_proxy="http://${hostip}:7890"
export http_proxy="http://${hostip}:7890"
export all_proxy="socks5://${hostip}:7890"
```
