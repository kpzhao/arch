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
sudo docker run --name mynginx -d --network host -v /home/kpzhao/mynginx.conf:/etc/nginx/nginx.conf -v /home/kpzhao:/root nginx
```
```
sudo docker run -d --name=mynginx --restart=always \
    --network host \
    -v ~/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v ~/nginx/vhost:/etc/nginx/conf.d/vhost \
    -v ~/nginx/ssl:/etc/nginx/ssl \
    -v ~/nginx/html:/usr/share/nginx/html \
    -v /home/kpzhao:/root \
    nginx
```
