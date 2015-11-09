class Profile
  include PageObject
  
  text_field(:primaryaddress1, :id => "primaryaddress1")
  text_field(:primaryaddress2, :id => "primaryaddress2")
  text_field(:organizationName, :id => "organizationName")
  text_field(:dba, :id => "DBA")
  
  def visit
    @browser.get($domain + "//#/profile")
  end
  
  def profile
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
    profile = @browser.first(:id, 'Profile')
  end
  
  def fax_number(value)
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:name, 'ProviderProfileForm').find_element(:id, 'faxNumber')}
    sleep 5
    @browser.find_element(:name, 'ProviderProfileForm').find_element(:id, 'faxNumber').clear
    @browser.find_element(:name, 'ProviderProfileForm').find_element(:id, 'faxNumber').send_keys(value)
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
  
  def card
    raise "Missing Provider Profile Image" unless self.profile.first(css: 'img').attribute(:src).include? ".jpg"
  end
  
  def card_body
    card_body = self.profile.first(:class, 'card-body').text
    raise "Missing Card Info" unless card_body.include? "AlexFranklin@gmail.com"
    raise "Missing Card Info" unless card_body.include? "Gender: Male"
  end
  
  def completeness
    completeness = self.profile.first(:class, 'completeness').text
    raise "Missing Completeness Info" unless completeness.include? "This profile is"
    raise "Missing Completeness Info" unless completeness.include? "% Complete"
  end
  
  def addresses
    addresses = self.profile.first(:class, 'panel').text
    raise "Missing Addresses Info" unless addresses.include? "Addresses"
    raise "Missing Addresses Info" unless addresses.include? "Primary Address"
    raise "Missing Addresses Info" unless addresses.include? "Mailing Address"
    raise "Missing Addresses Info" unless addresses.include? "Practice Address"
  end
  
  def additional_information
    add_info = self.profile.all(:class, 'panel').last.text
    raise "Additional Information" unless add_info.include? "Additional Information"
    raise "Additional Information" unless add_info.include? "Payor:"
    raise "Additional Information" unless add_info.include? "Language:"
    raise "Additional Information" unless add_info.include? "Degree:"
  end
end