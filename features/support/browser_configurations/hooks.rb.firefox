require 'selenium-webdriver'
require 'page-object'
require 'cucumber'
require 'rspec'
require 'thor'

$domain = "http://zenprmalpha.ahealthtech.com/"
Before do
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.window.maximize
end

After do
  @browser.close
end