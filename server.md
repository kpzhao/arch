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
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker
```
## 安装mysql
```
sudo docker run --name trojan-mariadb --restart=always -p 3306:3306 -v /home/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=trojan -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=trojan -d mariadb:10.2
```
## 安装trojan
```
sudo docker run -it -d --name trojan --net=host --restart=always --privileged jrohy/trojan init
docker exec -it trojan bash
```
