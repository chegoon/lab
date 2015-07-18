class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


def self.new_with_session(params, session)
	puts "self new with session launched"
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
    	puts "user attributes saved"
      user.attributes = params
      user.valid?
    end
  else
    super
  end    
end

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

def password_required?
  super && provider.blank?
end
=begin
	def self.from_omniauth(auth)
	    user = User.where(:email => auth.email).first

	    #Uncomment the section below if you want users to be created if they don't exist
	     unless user
	         user = User.create(name: auth.info.name,
	            email: auth.email,
	            password: Devise.friendly_token[0,20]
	         )
	     end
	    user
	end
=end
end
