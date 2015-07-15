Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["610612216570-ti8l8mocpfjkuhsfl7m788fa0p55vqkf.apps.googleusercontent.com"], ENV["rZ1RGSqn4EZsWjRFW4gU7SVc"]
end