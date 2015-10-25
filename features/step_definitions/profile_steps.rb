class Profile
  include PageObject
  
  text_field(:primaryaddress1, :id => "primaryaddress1")
  text_field(:primaryaddress2, :id => "primaryaddress2")
  text_field(:organizationName, :id => "organizationName")
  text_field(:dba, :id => "DBA")
  
  def visit
    @browser.get($domain + "//#/profile")
  end
  
  def edit
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-pencil')}
    @browser.first(:class, 'fa-pencil')
  end
  
  def save
    @browser.first(:class, 'fa-floppy-o')
  end
end

Given /I update the profile page/i do
  @page = Profile.new(@browser)
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
  @browser.first(:id, 'Profile').click
  sleep 1
  @browser.first(:link, 'Profile').click
  sleep 1
  @page.edit.click
  sleep 2
  @page.dba=("Bronx-Lebanon " + Time.now.strftime("%m_%d_%Y_%H_%M_%S"))
  @page.save.click
end

