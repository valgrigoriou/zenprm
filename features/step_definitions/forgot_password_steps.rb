class ForgotPassword
  include PageObject
  
  text_field(:forgot_password_email, :id => "forgotPasswordEmail")
  
  def visit_page
    @browser.get($domain + "/#/forgotpassword")
  end
end

Given /I am on the forgot password page/i do
  @page = ForgotPassword.new(@browser)
  @page.visit_page
end

Given /I submit the following email "(.*)"/i do |email|
  @page.forgot_password_email=(email)
  @browser.find_element(name: 'changePasswordForm').submit
end

# Given /I verify email was sent/i do
  #setup Gmail gem for verification
# end



