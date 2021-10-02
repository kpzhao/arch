## pacman 用法
[pacman (简体中文) - ArchLinux wiki](https://wiki.archlinux.org/title/Pacman_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
## 更新
`pacman -Syu`：对整个系统进行更新
`pacman -Syuu` 降级一些过于新的软件包
如果你已经使用`pacman -Sy`将本地的包数据库与远程的仓库进行了同步，也可以只执行：`pacman -Su`

## 安装包
`sudo pacman -S` 包名：例如，执行 `pacman -S firefox` 将安装 `Firefox`。你也可以同时安装多个包，只需以空格分隔包名即可。添加`--needed`选项可以忽略已经安装的软件。
`sudo pacman -Sy` 包名：与上面命令不同的是，该命令将在同步包数据库后再执行安装。
`sudo pacman -Sv` 包名：在显示一些操作信息后执行安装。
`sudo pacman -U` 文件：安装本地包，其扩展名为 `pkg.tar.gz`。
`sudo pacman -U http://www.example.com/repo/example.pkg.tar.xz`：安装一个远程包
## 删除包
`sudo pacman -R` 包名：该命令将只删除包，保留其全部已经安装的依赖关系
`sudo pacman -Rs` 包名：在删除包的同时，删除其所有没有被其他已安装软件包使用的依赖关系
`sudo pacman -Rsc` 包名：在删除包的同时，删除所有依赖这个软件包的程序
`sudo pacman -Rd` 包名：在删除包时不检查依赖。
## 搜索包
`pacman -Ss` 关键字：在仓库中搜索含关键字的包。
`pacman -Qs` 关键字： 搜索已安装的包。
`pacman -Qi` 包名：查看有关包的详尽信息。
`pacman -Ql` 包名：列出该包的文件。
## 其他用法
`sudo pacman -Sw` 包名：只下载包，不安装。
`sudo pacman -Sc`：清理未安装的包文件，包文件位于 /var/cache/pacman/pkg/ 目录。
`sudo pacman -Scc`：清理所有的缓存文件。
`sudo pacman -R $(pacman -Qdtq)` # 清除系统中无用的包
如果你要查找包含特定文件的包：

Copy
## 同步数据库
`pacman -Fy`
## 查找包含该文件的包
`pacman -F file_name`


