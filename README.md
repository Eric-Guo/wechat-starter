# wechat-starter

[![Build Status][travis-badge]][travis]

Template for developing wechat in rails.

### Features

* Process messages with [Eric-Guo/wechat](https://github.com/Eric-Guo/wechat)

* UI library using [weui](https://github.com/weui/weui) with [weui-rails](https://github.com/Eric-Guo/weui-rails)

* Pay with [jasl/wx_pay](https://github.com/jasl/wx_pay)

* OAuth2 with [skinnyworm/omniauth-wechat-oauth2](https://github.com/skinnyworm/omniauth-wechat-oauth2)

### Screenshots

<img src="http://i.imgur.com/WimbzPX.png" width="240">
<img src="http://i.imgur.com/urwmWZv.png" width="240">
<img src="http://i.imgur.com/UPw6FRc.png" width="240">

### Demo

<img src="http://i.imgur.com/TcnHLED.png" width="300">

# Install

### See wiki first

* [Wiki](https://github.com/goofansu/wechat-starter/wiki)

### Deploy to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Deploy to your own server

* Requirements

    * PostgreSQL

    * Configure "服务器地址" as `http://your-domain.com/wechat`

    * Configure "测试授权目录" as `http://your-domain.com/`

* Install

    * Create your new project and add this repo as template
    
        ``` bash
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
        wechat_trusted_domain_fullname: "http://your_dev.proxy.qqbrowser.cc"

        # following is optional if you don't need wechat pay
        wechat_pay_mch_id: "merchant id"
        wechat_pay_api_key: "32 bits api key configured in pay.weixin.qq.com"
        wechat_pay_notify_url: "url to accept pay result notification"
        ```

    * Start server

        `puma -C config/puma.rb`

# Create customized menu

It depends on `Rails.env` to choose the menu from config folder.

For example, if `Rails.env == production`, then `config/menu_production.yaml` is chosed.

``` bash
# create menu
rake wechat:menu_create

# show menu
rake wechat:menu
```

# References

* [omniauth with devise](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)

# Contributors

* [Eric-Guo](https://github.com/Eric-Guo)

[travis-badge]: https://travis-ci.org/goofansu/wechat-starter.svg
[travis]: https://travis-ci.org/goofansu/wechat-starter
