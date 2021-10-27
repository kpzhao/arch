## 创建目录
```
mkdir -p /mnt/c/aria2/aria2-config
mkdir -p /mnt/c/aria2/aria2-downloads
```
## 后端
```
sudo podman run -d \
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
## 前端
```
sudo podman run -d \
    --name ariang \
    --log-opt max-size=1m \
    --restart unless-stopped \
    --network host \
    docker.io/p3terx/ariang --port 6880
```
访问`127.0.0.1:6880`即可

```
sudo podman generate systemd --restart-policy=always -t 1 --name -f aria2-pro
sudo cp container-aria2-pro.service /etc/systemd/system/
sudo systemctl enable container-aria2-pro

sudo podman generate systemd --restart-policy=always -t 1 --name -f ariang
sudo cp container-ariang.service /etc/systemd/system/
sudo systemctl enable container-ariang
```

## 自启
```
# 创建systemd元文件
# --restart-policy=always自动重启
# -t 1 停止超时时间为1秒
# --name 在创建的systemd元文件中，用容器name启动、停止容器
# -f 在当前目录创建{container,pod}-{ID,name}.service格式的元文件，不加此参数，创建内容只在控制台显示。
podman generate systemd --restart-policy=always -t 1 --name -f caddy

# 把文件复制到/etc/systemd/system/目录
cp container-caddy.service /etc/systemd/system/

# 设置开机自启动
systemctl enable container-caddy

# 如果容器当前运行，先停止掉
podman stop caddy

# 启动服务
systemctl start container-caddy

# 查看状态
systemctl status container-caddy
```
