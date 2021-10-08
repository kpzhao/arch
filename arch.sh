#!/data/data/com.termux/files/usr/bin/bash

#检测架构
case $(uname -m) in
x86_64)
  archtype="amd64"
  ;;
*)
  echo "不支持的架构 $(uname -m)"
  exit 1
  ;;
esac

#配置清华源
sed -i -e '1i Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
#初始化
pacman-key --init
pacman-key --populate
#启用 multilib 库
echo -e '[multilib]\nInclude = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
#配置ArchLinuxcn清华源
echo -e '[archlinuxcn]\nServer = Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
pacman -Sy
pacman -Sq --noconfirm archlinuxcn-keyring
pacman -Sy

#配置中文环境
echo "正在配置中文环境..."
sed -i 's/#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
echo -e "LANG=zh_CN.UTF-8\nLANGUAGE=zh_CN:zh:en_US" > /etc/locale.conf
locale-gen
#Arch自带了man，无需再次安装，仅安装中文语言包
pacman -Sq --noconfirm man-pages-zh_cn

#配置国内时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

echo  "正在升级所有软件包..."
pacman -Syu --noconfirm

sleep 1

#配置pacman
sed -i 's/#Color/Color/g' /etc/pacman.conf #更改pacman为彩色输出
echo "设置完成"
sed -i 's/#VerbosePkgLists/VerbosePkgLists/g' /etc/pacman.conf #使用pacman升级软件包前对比版本
echo "设置完成"

choose "是否要安装yay（AUR helper/Pacman wrapper）？"
if [ $? == 1 ]; then
	cd ~
	echo "正在安装依赖..."
	pacman -Sq --needed --noconfirm base-devel git go
  sudo pacman -S --needed yay
	echo "正在更换AUR源到清华源..."
	yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
	echo "yay安装完成"
fi

choose "是否要安装Zsh？"
if [ $? == 1 ]; then
	pacman -Sq --noconfirm zsh
	chsh -s /usr/bin/zsh
	choose "是否要安装Oh My Zsh？"
	if [ $? == 1 ]; then
		pacman -Sq --noconfirm oh-my-zsh-git
		cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
	fi
	echo "请注意：接下来可选安装的插件在安装时均没有配置为由Oh My Zsh管理，安装以下插件并不需要安装Oh My Zsh，如果您要安装Oh My Zsh的插件，请手动配置。"
	echo "请注意：配置过多的插件可能会导致Zsh运行缓慢。"
	choose "是否要安装Zsh语法高亮插件（zsh-syntax-highlighting）？"
	if [ $? == 1 ]; then
		pacman -Sq --noconfirm zsh-syntax-highlighting
		echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
	fi
	choose "是否要安装Zsh自动建议插件（zsh-autosuggestions）？"
	if [ $? == 1 ]; then
		pacman -Sq --noconfirm zsh-autosuggestions
		echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
	fi
	choose "是否要安装Zsh历史查询插件（zsh-history-substring-search）？"
	if [ $? == 1 ]; then
		pacman -Sq --noconfirm zsh-history-substring-search
		echo "source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" >> ~/.zshrc
	fi
	if [ ! -e ~/.zshrc ]; then
		touch ~/.zshrc
	fi
	echo "arch boot" >> ~/.zshrc
fi

#因涉及下面的桌面环境安装问题，故放弃
#choose "使用root账户工作可能不够安全，您是否要新建一个低权限用户？"
#if [ $? == 1 ]; then
#	echo "请设定root密码"
#	passwd
#	read -p "请设定新用户名：" username
#	if [ -e "/usr/bin/zsh" ]; then
#		useradd -m -g users -G wheel -s /usr/bin/zsh "$username"
#	else
#		useradd -m -g users -G wheel -s /bin/bash "$username"
#	fi
#	choose "您是否要为新用户（$username）设置密码？"
#	if [ $? == 1 ]; then
#		echo "请设定新用户（$username）的密码"
#		passwd $username
#	fi
#	echo "配置完成"
#fi
