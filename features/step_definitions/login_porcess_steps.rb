Given /I login with "(.*)" and "(.*)"/i do |username, password|
  @login.visit_page
  @login.username=(username)
  @login.password=(password)
  @login.login_button.submit
  sleep 2
end

Given /I logout/i do
  @sidebar.settings_button.click
  @sidebar.sign_out_link.click
  sleep 1
end
  