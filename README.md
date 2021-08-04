# arch
## 123
### 123
#### 123
##### 123
## 网络
```
dhcpcd  
```
## 换源
编辑 `/etc/pacman.d/mirrorlist` ，在文件的最顶端添加  
```
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch  
sudo pacman -Syyu
```
## 添加新用户
```
useradd -m -G wheel -s /bin/bash kpzhao  
passwd kp (666999) 
vim /etc/sudoers
```
或者
先把系统默认编辑器设置成 vim `export EDITOR=vim` 或者 `ln -s /usr/bin/vim /usr/bin/vi` 
然后编辑`visudo` 
添加一行`kp ALL=(ALL) ALL`
## 设置zsh为默认的shell
```
sudo pacman -Sy zsh
sudo chsh -s /bin/zsh username  
```

## 安装aur（不能在root用户下  
```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
## 安装archlinuxcn源
在/etc/pacman.conf中添加archlinuxcn的源  
```
[archlinuxcn]    
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch  
```
安装密钥包
```
pacman -Sy archlinuxcn-keyring  
```
更新软件库
```
pacman -Sy
```
## locale
```
vim /etc/locale.gen  
去掉这四行前面的 # 号`zh_CN.UTF-8 UTF-8` `zh_HK.UTF-8 UTF-8` `zh_TW.UTF-8 UTF-8` `en_US.UTF-8 UTF-8`  
vim /etc/locale.conf  
第一行设置为 LANG=en_US.UTF-8  
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```
## 安装中文字体
```
pacman -S ttf-dejavu wqy-microhei
```
## 安装xfce4
```
sudo pacman -Sy xorg xfce4  
startxfce4
```

## 安装podman
```
sudo pacman -Sy podman
```

# Rootless configuration file changes
If you plan to run podman as a non-root user, you should start with a simple podman command like:

  podman info  
This action will create the Podman configuration file $HOME/.config/containers/libpod.conf. Simply edit this file and change the value of events_logger to <file>.

Rootfull configuration file changes
If you wish to run podman as a privileged user, you should first copy the Podman configuration file to /etc/containers/.

  sudo cp /usr/share/containers/libpod.conf /etc/containers
Now, edit the version in /etc/containers and change the value of cgroup_manager to cgroupfs. Then, uncomment the line for the events_logger key and change the value to <file>.

`sudo vim /etc/containers/containers.conf`
The following is a simple diff of the changes:
``` diff
27c27
- cgroup_manager = "systemd"
---
+ cgroup_manager = "cgroupfs"
109c109
- # events_logger = "journald"
---
+ events_logger = "file
```

### 配置镜像源
修改`/etc/containers/registries.conf`  
```
unqualified-search-registries = ["docker.io"]

[[registry]]
prefix = "docker.io"
insecure = false
blocked = false
location = "docker.io"  
[[registry.mirror]]
location = "2t36clkd.mirror.aliyuncs.com"
[[registry.mirror]]
location = "hub-mirror.c.163.com"
[[registry.mirror]]
location = "registry.docker-cn.com"
```
```
sudo podman pull docker.io/archlinux  
sudo podman run -itd --restart=always --name alpha -p 5901:5901 --hostname kpzhao --mac-address 94:65:2d:34:9d:d6 --privileged archlinux
```
```
podman  run -d \
    --name aria2-pro \
    --restart unless-stopped \
    --log-opt max-size=1m \
    --network host \
    -e PUID=$UID \
    -e PGID=$GID \
    -e RPC_SECRET=666999 \
    -e RPC_PORT=6800 \
    -e LISTEN_PORT=6888 \
    -v /mnt/c/aria2/aria2-config:/config \
    -v /mnt/c/aria2/aria2-downloads:/downloads \
    p3terx/aria2-pro
```
### Initialize keyring

Please excute these commands to initialize the keyring.
(This step is necessary to use pacman.)

```shell
sudo pacman-key --init
sudo pacman-key --populate
```

### 安装 open-vm-tools
安装 open-vm-tools 和 gtkmm3：
`yay -S open-vm-tools gtkmm3`
设置 open-vm-tools 开机自启：
```
sudo systemctl enable vmtoolsd.service
sudo systemctl enable vmware-vmblock-fuse.service
```
## vnc+xfce4
```
sudo pacman -Sy xfce4 tigervnc
vncpasswd
/etc/tigervnc/vncserver.users
```
新建~/.vnc/config
```
session=lxqt
geometry=2736x1824
localhost
alwaysshared
```

```
systemctl start vncserver@:1
```
