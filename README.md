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
podman pull docker.io/archlinux  
```
