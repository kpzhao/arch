## 安装 ARCHWSL2
在[yuk7/ArchWSL - releases](https://github.com/yuk7/ArchWSL/releases/tag/21.8.28.0)下载`Arch.zip`，解压，双击`Arch.exe`进行安装。详见[yuk7/ArchWSL - Wiki](https://github.com/yuk7/ArchWSL)
## 以下在root用户下
## 换源更新
```
passwd # 设置密码
# 设置软件源
echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
# 添加写保护，防止被修改
chattr +i /etc/pacman.d/mirrorlist
# 初始化 keyring
pacman-key --init
pacman-key --populate
pacman -Syu # 更新
```
## 启用 multilib 库
multilib 库包含 64 位系统中需要的 32 位软件和库
`vim /etc/pacman.conf`，取消这几行的注释：
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
并且取消该文件中`#Color`这一行的注释，以启用彩色输出
## 添加 archlinuxcn 源
Arch Linux 中文社区仓库 是由 Arch Linux 中文社区驱动的非官方用户仓库。
`vim /etc/pacman.conf`
在文件末尾加上：
```
[archlinuxcn]    
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch  
```
或者
```
echo -e '[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
```
然后：
```
pacman -Syy
pacman -S archlinuxcn-keyring
```
## 安装中文字体
```
sudo pacman -S wqy-microhei
```
`sudo vim /etc/locale.gen`，取消下面两行的注释：
```
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
```
然后`sudo locale-gen`初始化语言环境
```
vim /etc/locale.conf  
第一行设置为 LANG=en_US.UTF-8  
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```
或者
```
sudo sed -i 's/#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen \
&& sudo bash -c 'echo -e "LANG=zh_CN.UTF-8\nLANGUAGE=zh_CN:zh:en_US" > /etc/locale.conf' \
&& sudo locale-gen
```
## Arch自带了man，无需再次安装，仅安装中文语言包
```
pacman -Sq --noconfirm man-pages-zh_cn
```
## 配置国内时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
## 配置pacman
```
sed -i 's/#Color/Color/g' /etc/pacman.conf #更改pacman为彩色输出
sed -i 's/#VerbosePkgLists/VerbosePkgLists/g' /etc/pacman.conf #使用pacman升级软件包前对比版本
```
## 创建用户
```
useradd -m -G wheel -s /bin/bash kpzhao  
passwd kpzhao (666999) 
```
加入sudo组
```
ln -s /usr/bin/vim /usr/bin/vi
visudo
```
将以下两行行首的#去掉
```
# %wheel ALL=(ALL) ALL
# %wheel ALL=(ALL) NOPASSWD: ALL
```
在 powershell 中进入到 Arch.exe 所在文件夹，设置 WSL 默认登陆用户和默认的 WSL：
```
.\Arch.exe config --default-user kpzhao
wsl -s Arch
```
## 安装 yay （以下非root用户）
```
sudo pacman -S --needed base-devel
```
出现`:: fakeroot is in IgnorePkg/IgnoreGroup. Install anyway? [Y/n]`，选 n，接下来一直回车即可。
```
sudo pacman -S --needed yay
````
### yay 换源
```
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
````
## 安装其他的一些软件
```
sudo pacman -S --needed neofetch lolcat bat tokei tree screenfetch
neofetch | lolcat -a
```
## 安装 zsh
```
sudo pacman -S --needed zsh
# 编辑 /etc/passwd 文件，将 root 用户和 yourname 用户的 /bin/bash 改为 /bin/zsh
# 或者使用 chsh -s /bin/zsh 来改变当前用户的默认shell
sudo vim /etc/passwd
touch ~/.zshrc
# 在yourname用户创建软链接，让root用户也使用yourname用户的.zshrc
# 我觉得这样比较方便
sudo ln -s ~/.zshrc /root/.zshrc
```
## 使用 proxychains 代理终端程序
```
sudo pacman -S --needed proxychains-ng
```
需要先`cp -f /etc/proxychains.conf ~/.proxychains.conf`，然后在.bashrc中添加以下内容：
```
# 获取windows的ip
export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
# 删除 ~/.proxychains.conf 中 [ProxyList] 所在行到文件末尾的全部内容
sed -i '/\[ProxyList\]/,$d' ~/.proxychains.conf
# 往文件末尾添加socks5设置，这个 7890 是我的 qv②ray 的 socks5 端口号，改成你自己的
echo '[ProxyList]\nsocks5 '${WIN_IP}' 7890' >> ~/.proxychains.conf
# 设置别名；使用 ~/.proxychains.conf 作为proxychains的配置文件；让proxychains quiet（不输出一大串东西）
alias pc='proxychains4 -q -f ~/.proxychains.conf'
# 用来手动开关代理，建议走 http 协议，因为 wget 不支持 socks5
my_proxy=http://${WIN_IP}:7891
alias p-on='export all_proxy='${my_proxy}' http_proxy='${my_proxy}' https_proxy='${my_proxy}''
alias p-off='unset all_proxy http_proxy https_proxy'
```
然后
```
# 在 yourname 用户中
sudo ln -s ~/.proxychains.conf /root/.proxychains.conf
source ~/.bashrc
```
## clash 代理
```
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
export https_proxy="http://${hostip}:7890"
export http_proxy="http://${hostip}:7890"
export all_proxy="socks5://${hostip}:7890"
```
或者
```
echo -e "hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')\nexport https_proxy="http://${hostip}:7890"\nexport http_proxy="http://${hostip}:7890"\nexport all_proxy="socks5://${hostip}:7890"" >> .bashrc
```
## systemd
安装 daemonize
```
yay -S daemonize
```
下载[genie-systemd-1.44-1-x86_64.pkg.tar.zst](https://github.com/arkane-systems/genie/releases/download/v1.44/genie-systemd-1.44-1-x86_64.pkg.tar.zst)，并安装
```
curl -LJO https://github.com/arkane-systems/genie/releases/download/v1.44/genie-systemd-1.44-1-x86_64.pkg.tar.zst
sudo pacman -U genie-systemd-1.44-1-x86_64.pkg.tar.zst
```
运行 genie -i，让ArchWSL可以正常使用systemd
```
genie -s
```
问题 [Genie times out due to systemd-sysusers]（https://githubmemory.com/repo/arkane-systems/genie/issues/190?page=2）
```
systemctl edit systemd-sysusers.service #去掉LoadCredential=的#
LoadCredential= #添加一行
```
## 安装xfce4/kde
### xfce4
```
sudo pacman -S --needed xfce4 xfce4-goodies dbus dbus-glib
```
### kde
```
pacman -S plasma-meta konsole dolphin #安装plasma-meta元软件包以及终端和文件管理器
systemctl enable sddm #配置sddm
```
## 安装 tigervnc
```
sudo pacman -Sy tigervnc
vncpasswd #设置密码
vim /etc/tigervnc/vncserver.users #添加用户
```
新建`vim ~/.vnc/config`，内容为
```
session=xfce4 #或者换成kde
geometry=2736x1824
localhost
alwaysshared
```
启动`systemctl start vncserver@:1`

## WSL2 内存占用过高
新建文件C:\Users\用户名\.wslconfig
```
[wsl2]
memory=2GB
swap=0
localhostForwarding=true
```
## Tips
从文件资源管理器`\\wsl$`访问









