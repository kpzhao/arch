## root@43.129.169.167
域名 kpzhao.xyz
## 免密登录
```
ssh-keygen -t rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub root@43.129.169.167
ssh root@43.129.169.167
```
## centos安装docker
```
sudo dnf install podman
```
## 安装mysql
```
mkdir -p /home/mariadb
sudo podman run --name trojan-mariadb  -p 3306:3306 -v /home/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=trojan -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=trojan -d docker.io/mariadb:10.2
```
## 安装trojan
```
sudo podman run -it -d --name trojan --net=host --privileged docker.io/jrohy/trojan init
sudo podman exec -it trojan bash
```
## 自启
```
sudo podman generate systemd --restart-policy=always -t 1 --name -f trojan-mariadb
sudo podman generate systemd --restart-policy=always -t 1 --name -f trojan
sudo cp container-trojan-mariadb.service /etc/systemd/system/
sudo cp container-trojan.service /etc/systemd/system/
sudo systemctl enable container-trojan-mariadb
sudo systemctl enable container-trojan
```
## Linux-NetSpeed
```
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"
chmod +x tcp.sh
./tcp.sh
```
