class HomeController < ApplicationController
  # to allow using wechat, wechat_oauth2 in controller and wechat_config_js in view
  wechat_api

  def index
  end
end
