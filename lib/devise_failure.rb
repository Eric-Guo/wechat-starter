class DeviseFailure < Devise::FailureApp
  def redirect_url
    user_wechat_omniauth_authorize_path
  end
end
