# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
SporkWeb::Application.initialize!

puts Rails.root.join('config' + '/config.yml')

APP_CONFIG = YAML.load_file(Rails.root.join('config' + '/config.yml'))[Rails.env]