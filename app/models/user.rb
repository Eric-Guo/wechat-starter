class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  before_validation :set_password
  # validates :birthday, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.nickname = auth.info.nickname
      user.sex = auth.info.sex
      user.avatar = auth.info.headimgurl
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.wechat_data']
        user.provider = data['provider']
        user.uid = data['uid']
        user.nickname = data['info']['nickname']
        user.sex = data['info']['sex']
        user.avatar = data['info']['headimgurl']
      end
    end
  end

  private
  def set_password
    self.password ||= Devise.friendly_token[0, 20]
  end
end
