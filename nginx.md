## 文件服务器
vim mynginx.conf

```
server {
    listen       7070;
    server_name  localhost;
    charset utf-8;

    location /files {
        #在docker内nginx的目录
        alias /home/files;
        expires 1d;
        allow all;
        autoindex on;
    }
}
```
```
sudo docker run --name mynginx -d -p 7070:7070 -v /home/kpzhao/mynginx.conf:/etc/nginx/nginx.conf -v /home/kpzhao:/home/files nginx
```
