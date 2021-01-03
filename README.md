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
useradd -m -G wheel -s /bin/bash kp  
passwd kp  
vim /etc/sudoers
```
或者
先把系统默认编辑器设置成 vim `export EDITOR=vim`  
然后编辑`visudo` 
添加一行`kp ALL=(ALL) ALL`
## 设置zsh为默认的shell
```
sudo pacman -Sy zsh
sudo chsh -s /bin/zsh username  
```

## 安装aur（不能在root用户下  
```
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
pacman -S archlinuxcn-keyring  
```
更新软件库
```
pacman -Sy
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
location = "hub-mirror.c.163.com"
[[registry.mirror]]
location = "registry.docker-cn.com"
```
```
sudo podman pull docker.io/archlinux  
sudo podman run -itd --restart=always --name alpha -p 5901:5901 --hostname kpzhao --mac-address 94:65:2d:34:9d:d6 --privileged archlinux
```
## vnc+xfce4
```
sudo pacman -Sy xfce4 tigervnc
vncserver :1
```
