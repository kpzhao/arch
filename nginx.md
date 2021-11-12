## 文件服务器

```
vim mynginx.conf
```
```
server {
            listen 9000;
            server_name localhost;
            charset utf-8;

            location / {
                    root /root;
                    autoindex on;
                    autoindex_exact_size off;
                    autoindex_localtime on;
            }
    }
```
```
sudo docker run --name mynginx -d -p 9000:9000 -v /home/kpzhao/mynginx.conf:/etc/nginx/nginx.conf -v /home/kpzhao:/root nginx
```
