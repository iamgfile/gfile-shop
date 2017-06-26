class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => "encryption_key" #ENV['ENCRYPTION_KEY']
         
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
	 :omniauthable

  def self.find_for_google(auth)
    if user = User.where(email: auth.info.email).first
      user
    else 
      user = User.create(email:    auth.info.email,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save!
    end
  end    


end
