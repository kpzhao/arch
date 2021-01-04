# docker
## dokcerfile
在一个空白目录中，建立一个文本文件，并命名为 `Dockerfile`： 内容如下  
```
FROM docker.io/archlinux  
CMD [ "/sbin/init" ]
```
构建
```
podman build --format=docker -t arch .
```
启动
```
podman run -d --name=arch -p 80:80 arch
```

## aria2
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

## arch
```
sudo podman pull docker.io/archlinux  
sudo podman run -itd --restart=always --name alpha -p 5901:5901 --hostname kpzhao --mac-address 94:65:2d:34:9d:d6  archlinux
```
