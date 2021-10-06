# git
## git clone
git remote remove 老的远程地址链接

//可以使用git remote -v 查看老的github远程地址链接

git remote add origin https://<token>@github.com/kpzhao/repo.git
或者密码填写github_token
## git fetch
## git cherry-pick
```
git cherry-pick commitid 单个提交  
git cherry-pick commitid1..commitid100 多个提交（不包含1  
git cherry-pick commitid1^..commitid100 多个提交（包含1  
```
## git commit
## git push
git push <远程主机名> <本地分支名>:<远程分支名> 
## git tag
```
git tag v1
git push --tags
```

