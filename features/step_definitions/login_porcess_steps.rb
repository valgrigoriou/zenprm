class Authentication
  include PageObject
  
  text_field(:username, :id => "username")
  text_field(:password, :id => "password")
  
  def visit_page
    @browser.get($domain + "/#/login")
  end
  
  def login_button
    @browser.find_element(:name, 'loginForm')
  end
end

Given /I login with "(.*)" and "(.*)"/i do |username, password|
  @page = Authentication.new(@browser)
  @page.visit_page
  @page.username=(username)
  @page.password=(password)
  @page.login_button.submit
end

Given /I logout/i do
  # binding.pry
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:link, 'Bronx-Lebanon Hospital Center')}
  puts @browser.find_element(css: ".growl-container div").attribute('class').should include "alert-success"
  @browser.first(:class, 'close').click unless @browser.first(:class, 'close').displayed? == false
  @browser.first(:class, 'fa-user').click
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-sign-out')}
  @browser.first(:class, 'fa-sign-out').click
end
  