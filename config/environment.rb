# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['FACEBOOK_APP_ID'] = '479024818787146'
ENV['FACEBOOK_SECRET'] = 'd0b5946bc0cdbd2f53f473a4138af375'

# Initialize the rails application
Carpool::Application.initialize!
