## LightUpload
[参考教程](https://gwliang.com/2021/04/02/OneDriveUploader-use/)
## 授权认证
点击右侧URL登录并授权，授权地址→[国际版、家庭版](https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=ad5e65fd-856d-4356-aefc-537a9700c137&response_type=code&redirect_uri=http://localhost/onedrive-login&response_mode=query&scope=offline_access%20User.Read%20Files.ReadWrite.All)
授权后会获取一个localhost开头打不开的链接，这里复制好整个链接地址，包括localhost
## 安装OneDriveUploader
打开这个界面，选择适合你系统的版本：https://github.com/gaowanliang/LightUploader/releases
下载文件
```
curl -LO https://github.com/gaowanliang/LightUploader/releases/download/v2.0.1/LightUploader_Linux_x86_64.tar.gz
```
# 解压文件
```
tar -zxvf LightUploader_Linux_x86_64.tar.gz -C /usr/local/bin/
```
# 给予权限
```
chmod +x /usr/local/bin/LightUploader
```
# 可选 软链接 类似于 Windows 的快捷方式
```
ln -s /usr/local/bin/LightUploader /usr/bin/LightUploader
```
