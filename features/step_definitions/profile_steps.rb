class Profile
  include PageObject
  
  text_field(:primaryaddress1, :id => "primaryaddress1")
  text_field(:primaryaddress2, :id => "primaryaddress2")
  text_field(:organizationName, :id => "organizationName")
  text_field(:dba, :id => "DBA")
  text_field(:fax_number, :id => "faxNumber")
  
  def visit
    @browser.get($domain + "//#/profile")
  end
  
  def projects_tab
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-briefcase')}
    @browser.first(:class, 'fa-briefcase')
  end
  
  def edit
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-pencil')}
    @browser.first(:class, 'fa-pencil')
  end
  
  def save
    @browser.first(:class, 'fa-floppy-o')
  end
  
  def manage_emails
    @browser.first(:class, 'fa-envelope-o')
  end
  
  def email_address
    @browser.find_element(:name, 'EmailForm').first(:class, 'ng-valid-email')
  end
  
  def add_email_button
    @browser.find_element(:name, 'EmailForm').find_element(:class, 'fa-plus')
  end
end

Given /I view the projects tab/i do
  @page = Profile.new(@browser)
  @page.projects_tab.click
end

Given /I update the profile page/i do
  @page = Profile.new(@browser)
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
  @browser.first(:id, 'Profile').click
  sleep 1
  @browser.first(:link, 'Profile').click
  sleep 1
  @page.edit.click
  @page.fax_number=("")
  sleep 2
  @page.fax_number=(Time.now.strftime("%m_%d_%Y_%H_%M_%S"))
  @page.save.click
end

# Given /I add a new email address/i do
#   @page = Profile.new(@browser)
#   Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
#   @browser.first(:id, 'Profile').click
#   sleep 1
#   @browser.first(:link, 'Profile').click
#   sleep 1
#   @page.edit.click
#   @page.manage_emails.click
#   @page.email_address.send_keys("zenprm44@gmail.com")
#   sleep 1
#   @page.add_email_button.click
#   sleep 1
#   puts @browser.all(:class, 'fa-times').last.click
# end

