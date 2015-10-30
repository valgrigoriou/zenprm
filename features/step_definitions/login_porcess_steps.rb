Given /I login with "(.*)" and "(.*)"/i do |username, password|
  @login.visit_page
  @login.username=(username)
  @login.password=(password)
  @login.login_button.submit
  sleep 1
end

Given /I return to login/i do
  @browser.first(:link,'Return to Login').click
end

Given /I logout/i do
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
  @browser.first(:id, 'Profile').click
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-sign-out')}
  @browser.first(:class, 'fa-sign-out').click
  Selenium::WebDriver::Wait.new(:timeout => 10).until {@browser.find_element(:class, 'fa-sign-in')}
end
  