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
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:class, 'fa-envelope-o')}
    @browser.first(:class, 'fa-envelope-o')
  end
  
  def email_address
    @browser.find_element(:name, 'EmailForm').first(:class, 'ng-valid-email')
  end
  
  def add_email_button
    @browser.find_element(:name, 'EmailForm').find_element(:class, 'fa-plus')
  end
end