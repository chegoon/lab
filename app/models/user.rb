class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  

def self.new_with_session(params, session)
	puts "self new with session launched"
  if session["devise.user_attributes"]
  	puts "user attributes saved"
    new(session["devise.user_attributes"], without_protection: true) do |user|

      user.attributes = params
      user.valid?
    end
  else
    super
  end    
end
=begin
def self.from_omniauth(auth)
	puts "self from omniauth launched"

  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	puts "user check #{user}"
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.email
    user.name = auth.info.name
  end
end
=end

	def self.from_omniauth(auth)
	    user = User.where(:provider => auth.provider, :uid => auth.uid).first

	    #Uncomment the section below if you want users to be created if they don't exist
	     unless user
	         user = User.create(name: auth.info.name,
	            email: auth.info.email,
              provider: auth.provider, 
              uid: auth.uid,
	            password: Devise.friendly_token[0,20]
	         )
	     end
      user
	end

def password_required?
  super && provider.blank?
end

end
