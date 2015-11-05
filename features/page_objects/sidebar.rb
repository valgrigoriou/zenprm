class SideBar
  include PageObject
  
  def settings_button
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Settings')}
    @browser.first(:id, 'Settings')
  end
  
  def profile_link
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
    @browser.first(:id, 'Profile')
  end
  
  def sign_out_link
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-sign-out')}
    @browser.first(:class, 'fa-sign-out')
  end
    
end