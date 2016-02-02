class DeviseFailure < Devise::FailureApp
  def redirect_url
    user_omniauth_authorize_path :wechat
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
