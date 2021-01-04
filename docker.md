## docker
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
podman run -d --name=mysysd_run -p 80:80 mysysd
```
