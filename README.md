# arch
## 123
### 123
#### 123
##### 123

## 换源
编辑 `/etc/pacman.d/mirrorlist` ，在文件的最顶端添加  
```
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch  
sudo pacman -Syyu
```

## 安装podman
```
sudo pacman -Sy podman
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
