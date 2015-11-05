class EditEmail
  include PageObject
  
  def email_form
    @browser.find_element(:name, 'EmailForm')
  end
  
  def email_address(value)
    Selenium::WebDriver::Wait.new(:timeout => 5).until {email_form.first(:class, 'ng-valid-email')}
    email_form.first(:class, 'ng-valid-email').send_keys(value)
  end
  
  def add_email_button
    email_form.first(:class, 'fa-plus')
  end
end