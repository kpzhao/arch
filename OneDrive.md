## GitHub自动续订
```
id
id=r'bc64b475-659f-4716-88d5-198c267bf3a4'
密码
secret=r'oj.7Q~IgLTBIIsm5_DSutlsCTJ_ju0oJTLVBe'

.\rclone authorize "onedrive" "2812ab3f-98db-4c6b-912b-1ca753a9c0b7" "KW3m8ZV-v6xRU.jK_mTdq-~_~S1Dp0L_0-"
redirect_uri:https://localhost:53682/
```
```
curl -X POST -d https://login.microsoftonline.com/common/oauth2/v2.0/token client_id={bc64b475-659f-4716-88d5-198c267bf3a4}&redirect_uri={https://localhost:53682/}&client_secret={oj.7Q~IgLTBIIsm5_DSutlsCTJ_ju0oJTLVBe} &refresh_token={refresh_token}&grant_type=refresh_token

curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'client_id=bc64b475-659f-4716-88d5-198c267bf3a4&scope=https%3A%2F%2Fgraph.microsoft.com%2F.default&client_secret=oj.7Q~IgLTBIIsm5_DSutlsCTJ_ju0oJTLVBe&grant_type=client_credentials' 'https://login.microsoftonline.com/common/oauth2/v2.0/token'

curl -X GET https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id={bc64b475-659f-4716-88d5-198c267bf3a4}&scope=https%3A%2F%2Fgraph.microsoft.com%2F.default&response_type=code&redirect_uri={https://localhost:53682/}
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

refresh_token:0.AT4A9an29eFETkC6rBWE-0B4GdxOzjRWkhlNvT7Tq5KhjBM-ANg.AgABAAAAAAD--DLA3VO7QrddgJg7WevrAgDs_wQA9P8-jUvWz7YeL8cQ4VQN5ip6flqD82tuqaYIyjz-4Wo_eXr9HGr_OhwLwhMRUuVySX44gm6stvjyoilsoxM0Nu7674rCEYVJHeMzdEEM1Tkdm9WSL1OdeovsMpPTavKFot00ovCLeu25mHX_eqnLulXRbiy8cH6Wi5JTd9ao7AiPatQIxrfMQAmqaZ9oJlXO-GY0x9r1A05yRoIH0mikCFtLxnoB9hP7hI2SneUABceGXRzlH9KoqSfpvDr5C8i1BK8j8ukiGqGDub0yiFOXqL7W9bIQz1dzjUFPXC-ikU10Gu2r1bJMyZBW0dYKikPp5CCKT-GEVV6SImLFEmHjKmpigW-vnPT2GGf_YnKFVZynT4Efnom-X11MBw4u9Dj9n8ZpmV1-YI5VMtgjjTwm0UXtt1Rcp4dTwDE7m-6L07coaaHmKHQEy1arl1b0lh0J9MTFPDL79Y9r-0wAchx-8kan6huSe86PiVDyMxWKeb5zqlQW7ks2gWccK6L3wZLm_9tRbrcL0EiWEh8GFsxPkcw9EuWcJnToTk0YpjzYFWvdbqQ9BML413VHT5liN_X0qm4wX97Y4IiXyERQovaddZfsf4WsCh2SID7-uZc46jBuAPCJP3_a_gD4Yt_i41nAbVR-zN4QMCm7MCStg7ZrHRL9r3WjcRr0E3RNHA9AXM8Dee0M1RCv9Xn18FmjfTYppQDdr2BMGgdPinitnDQt5WR0h_zYftsMUSwHeF7tcmS_ftrdRhSdY6JTizsD6lleSQAQSzv7jO8XLJ9hwb6zfawsCQOQuOE2oJzy7ExWuXsITcx6k2J-3KgW6KZNH3ZneyrXHm1Sak2iR6LCMFZa05iQt6_SiKd9vzCYH59UsjMWnkiIS9lAIRfu9nINPJoxm65q5BzaurD8cmat4bBeRomu2J7djLvfkOg1n7VOzt6x7Cw9553yoeQo4wzcAbLlpZwgaY83d2toCRAJ77BBgcFkRTjxMdw67Tr8LA3TWyVctlVM8vHUHIJx
```
