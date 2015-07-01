# Load the Rails application.
require File.expand_path('../application', __FILE__)


Yt.configure do |config|
  config.api_key = 'AIzaSyCZT4tgs-exq5My9CaiMmf4N6rQ2WFNzIA'
end

# Initialize the Rails application.
Rails.application.initialize!
