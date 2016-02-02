# wechat-starter

Template for developing wechat in rails.

### Features

1. Integerate gem [Eric-Guo/wechat](https://github.com/Eric-Guo/wechat)

2. Integerate gem [jasl/wx_pay](https://github.com/jasl/wx_pay)

### Usage

1. Create your new project and add this repo as template

```
mkdir your_app
cd your_app
git init
git remote add template https://github.com/goofansu/wechat-starter.git
git fetch template
git checkout -b master template/master
bundle install
```

2. Create `config/application.yml` and config following information:

```
wechat_app_id: "AppID"
wechat_secret: "AppSecret"
wechat_token:  "Token"
wechat_encoding_aes_key: "EncodingAESKey"

# following is optional if you don't need wechat pay
wechat_pay_mch_id: "merchant id"
wechat_pay_api_key: "32 bits api key configured in pay.weixin.qq.com"
wechat_pay_notify_url: "url to accept pay result notification"
```
