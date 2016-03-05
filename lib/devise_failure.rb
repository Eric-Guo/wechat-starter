class DeviseFailure < Devise::FailureApp
  def redirect_url
    user_omniauth_authorize_path :wechat
  end
end
