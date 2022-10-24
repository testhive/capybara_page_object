#encoding: UTF-8
require 'rspec'
require 'capybara/rspec'
require 'webdrivers'
include Capybara::DSL
include RSpec
include RSpec::Matchers

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.default_selector = :css
Capybara.default_max_wait_time = 10
Capybara.ignore_hidden_elements = false
Capybara.exact = true
Capybara.app_host = 'http://www.apple.com/uk/'
#
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
# end