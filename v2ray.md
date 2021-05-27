# podman运行
```
podman run -d --name v2ray --privileged --restart always --network host jrohy/v2ray
```

自定义v2ray配置文件:
```
git clone https://github.com/kpzhao/v2ray.git 至root文件夹下
podman run -d --name v2ray --privileged -v /root/v2ray/config.json:/etc/v2ray/config.json --restart always --network host jrohy/v2ray
```

查看v2ray配置:
```
podman exec v2ray bash -c "v2ray info"
```

**warning**: 如果用centos，需要先关闭防火墙
```
systemctl stop firewalld.service
systemctl disable firewalld.service
```

## 建议
安装完v2ray后强烈建议开启BBR等加速: [Linux-NetSpeed](https://github.com/chiakge/Linux-NetSpeed)
```
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x tcp.sh
./tcp.sh
```
