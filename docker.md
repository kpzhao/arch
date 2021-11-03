# docker
## dokcerfile
在一个空白目录中，建立一个文本文件，并命名为 `Dockerfile`： 内容如下  
```
FROM docker.io/archlinux  
RUN pacman -Sy --noconfirm git python python-pip && \
pacman -Sy
```
构建
```
docker build -t arch .
```
启动
```
docker run -d --name=arch -p 80:80 arch
```

## aria2
### 后端
```
sudo docker  run -d \
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
    docker.io/p3terx/aria2-pro
```
### 前端
```
sudo docker run -d \
    --name ariang \
    --log-opt max-size=1m \
    --restart unless-stopped \
    --network host \
    p3terx/ariang --port 6880
```
## apache
```
docker run \
-p 80:80 \
-v $PWD/www/:/usr/local/apache2/htdocs/ \
-v $PWD/conf/httpd.conf:/usr/local/apache2/conf/httpd.conf \
-v $PWD/logs/:/usr/local/apache2/logs/ \
-d httpd
```

## arch
```
sudo docker pull docker.io/archlinux  
sudo docker run -itd --restart=always --name alpha -p 5901:5901 --hostname kpzhao --mac-address 94:65:2d:34:9d:d6  archlinux
```
