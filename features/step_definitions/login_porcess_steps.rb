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
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
  @browser.first(:id, 'Profile').click
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-sign-out')}
  @browser.first(:class, 'fa-sign-out').click
end
  