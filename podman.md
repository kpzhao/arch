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
