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
## usage
```
Usage of LightUploader:
  -a string
        // 初始化授权
        Setup and Init auth.json.
  -b string
        // 自定义上传分块大小, 可以提高网络吞吐量, 受限于磁盘性能和网络速度.
  -c string
        // 配置文件路径

  -r string
        // 上传到网盘中的某个目录, 默认: 根目录
  -l string
        // 软件语言
  -f string
        // *必要参数, 要上传的文件或文件夹
  -t string
        // 线程数, 同时上传文件的个数. 默认: 3
  -to int
        //单个数据包超时时间，默认为60s
  -tgbot string
        //使用Telegram机器人实时监控上传，此处需填写机器人的access token，形如123456789:xxxxxxxxx，输入时需使用双引号包裹。当写入内容为“1”时，使用配置文件中的BotKey和UserID作为载入项
  -uid string
        // 使用Telegram机器人实时监控上传，此处需填写接收人的userID，形如123456789
  -m int
        // 选择模式，0为替换OneDrive中同名文件，1为跳过，默认为0
  -v int
        // 选择版本，其中0为国际版，1为个人版(家庭版)，默认为0
 ```
 ## 示例
 ```
 # 一些示例:

# 将同目录下的 mm00.jpg 文件上传到 OneDrive 网盘根目录
LightUploader -c xxx.json -f "mm00.jpg"

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录
LightUploader -c xxx.json -f "Download" 

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘Test目录中
LightUploader -c xxx.json -f "Download" -r "Test"

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 10 线程
LightUploader -c xxx.json -t 10 -f "Download" 

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 10 线程，并跳过同名文件
LightUploader -c xxx.json -t 10 -f "Download" -m 1

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 10 线程，同时设置超时时间为30秒
LightUploader -c xxx.json -t 10 -f "Download" -to 30

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 10 线程，同时使用 Telegram Bot 实时监控上传进度
LightUploader -c xxx.json -t 10 -f "Download" -tgbot "123456:xxxxxxxx" -uid 123456789

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 10 线程，同时使用配置文件中的 Telegram Bot 参数载入程序实时监控上传进度（前提是配置文件中含有Telegram Bot 的参数）
LightUploader -c xxx.json -t 10 -f "Download" -tgbot "1"

# 将同目录下的 Download 文件夹上传到 OneDrive 网盘根目录中, 使用 15 线程, 并设置分块大小为 20M
LightUploader -c xxx.json -t 15 -b 20 -f "Download" 
```

```
cd /mnt/c/aria2 
LightUploader -c /home/kpzhao/kpzhao@kpzhao.onmicrosoft.com.json -f ""
```
 
