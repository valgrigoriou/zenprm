

Given /I view the projects tab/i do
  @profile.projects_tab.click
end

Given /I update the profile page/i do
  sleep 3
  @profile.edit.click
  sleep 1
  @profile.fax_number=("")
  sleep 2
  @profile.fax_number=(Time.now.strftime("%m_%d_%Y_%H_%M_%S"))
  @profile.save.click
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

