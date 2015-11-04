Given /I login with "(.*)" and "(.*)"/i do |username, password|
  @login.visit_page
  @login.username=(username)
  @login.password=(password)
  @login.login_button.submit
  if username != "Invalid"
    Selenium::WebDriver::Wait.new(:timeout => 15).until {@browser.first(:class, 'fa-sign-in').displayed? == false}
  end
end

Given /I logout/i do
  @sidebar.profile_button.click
  @sidebar.sign_out_link.click
  Selenium::WebDriver::Wait.new(:timeout => 15).until {@browser.first(:class, 'fa-sign-in').displayed? == true}
  sleep 1
end
  