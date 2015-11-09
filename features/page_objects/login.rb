class Login
  include PageObject
  
  text_field(:username, :id => "username")
  text_field(:password, :id => "password")
  
  def visit_page
    @browser.get($domain + "/#/login")
    cookies = @browser.manage.all_cookies
    raise "Missing ASP.NET_SessionId cookie" unless cookies.first[:name] == "ASP.NET_SessionId"
    raise "Missing Logo on the Login Page" unless @browser.first(css: 'img').attribute(:src) == "http://zenprmalpha.ahealthtech.com//assets/img/template/logo.png"
  end
  
  def login_button
    @browser.find_element(:name, 'loginForm')
  end
end