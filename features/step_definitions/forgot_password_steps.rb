Given /I am on the forgot password page/i do
  @forgot_password.visit_page
end

Given /I submit the following email "(.*)"/i do |email|
  @forgot_password.forgot_password_email=(email)
  @forgot_password.submit
end

Given /I return to login/i do
  @forgot_password.return_to_login.click
end

# Given /I verify email was sent/i do
  #setup Gmail gem for verification
# end



