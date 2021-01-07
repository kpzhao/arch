# centos6
## 换源
1、关闭fastestmirror
```
vi /etc/yum/pluginconf.d/fastestmirror.conf
#修改参数
enable=0
```
2、备份
```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
```
3、更换源
```
#替换为官方Vault源
wget -O /etc/yum.repos.d/CentOS-Base.repo https://static.lty.fun/%E5%85%B6%E4%BB%96%E8%B5%84%E6%BA%90/SourcesList/Centos-6-Vault-Official.repo
#替换为阿里云Vault镜像
wget -O /etc/yum.repos.d/CentOS-Base.repo https://static.lty.fun/%E5%85%B6%E4%BB%96%E8%B5%84%E6%BA%90/SourcesList/Centos-6-Vault-Aliyun.repo
```
