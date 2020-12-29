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
useradd -m -G wheel -s /bin/bash kain  
passwd kain  
vim /etc/sudoers
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
