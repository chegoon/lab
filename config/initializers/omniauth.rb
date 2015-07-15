Rails.application.config.middleware.use OmniAuth::Builder do
	GOOGLE_CLIENT_ID = "610612216570-ti8l8mocpfjkuhsfl7m788fa0p55vqkf.apps.googleusercontent.com"
	GOOGLE_CLIENT_SECRET = "rZ1RGSqn4EZsWjRFW4gU7SVc"
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end