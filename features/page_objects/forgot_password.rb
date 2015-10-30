class ForgotPassword
  include PageObject
  
  text_field(:forgot_password_email, :id => "forgotPasswordEmail")
  
  def visit_page
    @browser.get($domain + "/#/forgotpassword")
  end
  
  def submit
    @browser.find_element(name: 'changePasswordForm').submit
  end
  
  def return_to_login
    @browser.first(:link,'Return to Login')
  end
end

