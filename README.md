# wechat-starter

Template for developing wechat in rails.

### Features

* Integerate gem [Eric-Guo/wechat](https://github.com/Eric-Guo/wechat)

* Integerate gem [jasl/wx_pay](https://github.com/jasl/wx_pay)

### Requirements

* Mysql

* Configure the server url as `http://your-domain.com/wechat`

### Usage

* Create your new project and add this repo as template

```
mkdir your_app
cd your_app
git init
git remote add template https://github.com/goofansu/wechat-starter.git
git fetch template
git checkout -b master template/master
bundle install
rake db:create
rake db:migrate
```

* Create `config/application.yml` and config following information:

``` yaml
wechat_app_id: "AppID"
wechat_secret: "AppSecret"
wechat_token:  "Token"
wechat_encoding_aes_key: "EncodingAESKey"

# following is optional if you don't need wechat pay
wechat_pay_mch_id: "merchant id"
wechat_pay_api_key: "32 bits api key configured in pay.weixin.qq.com"
wechat_pay_notify_url: "url to accept pay result notification"
```

* Start server

`rails s`
