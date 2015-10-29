class Login
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