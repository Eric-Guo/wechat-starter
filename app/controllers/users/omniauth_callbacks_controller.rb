class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def wechat
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'wechat') if is_navigational_format?
    else
      session['devise.wechat_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
