## GitHub自动续订
```
id
id=r'bc64b475-659f-4716-88d5-198c267bf3a4'
密码
secret=r'oj.7Q~IgLTBIIsm5_DSutlsCTJ_ju0oJTLVBe'

.\rclone authorize "onedrive" "2812ab3f-98db-4c6b-912b-1ca753a9c0b7" "KW3m8ZV-v6xRU.jK_mTdq-~_~S1Dp0L_0-"
redirect_uri:https://localhost:53682/
code 
```
### code
浏览器访问https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=bc64b475-659f-4716-88d5-198c267bf3a4&scope=offline_access%20Files.Read%20Files.ReadWrite.All&response_type=code&redirect_uri=https://localhost:53682/'
在code=和&session之间
### access token and refresh token
```
curl -X POST \
-H "Content-Type: application/x-www-form-urlencoded" \
-d 'client_id=bc64b475-659f-4716-88d5-198c267bf3a4' \
-d 'redirect_uri=https://localhost:53682/' \
-d 'client_secret=oj.7Q~IgLTBIIsm5_DSutlsCTJ_ju0oJTLVBe' \
-d 'code=authorization code' \
-d 'grant_type=authorization_code' \
'https://login.microsoftonline.com/common/oauth2/v2.0/token'
```


## GitHub自动续订
```
id
id=r'2812ab3f-98db-4c6b-912b-1ca753a9c0b7'
密码
secret=r'KW3m8ZV-v6xRU.jK_mTdq-~_~S1Dp0L_0-'

.\rclone authorize "onedrive" "2812ab3f-98db-4c6b-912b-1ca753a9c0b7" "KW3m8ZV-v6xRU.jK_mTdq-~_~S1Dp0L_0-"
redirect_uri:http://localhost:53682/
```

## sharelist
### docker安装
详情见[reruin/sharelist](https://github.com/reruin/sharelist)
```
docker run -d -v /etc/sharelist:/sharelist/cache -p 33001:33001 --name="sharelist" reruin/sharelist:next
```
打开`ip:33001`进行挂载
```
client_id:34ce4edc-9256-4d19-bd3e-d3ab92a18c13

client_secret:.Yv7Q~jqe~vDuCCm4Ib9FwOMvA2EB6d3KV~uV

redirect_uri:https://reruin.github.io/sharelist/redirect.html

refresh_token:
```
