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

Given /I add a new email address/i do
  random = rand(999999999).to_s
  @page = Profile.new(@browser)
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Profile')}
  @browser.first(:id, 'Profile').click
  sleep 1
  @browser.first(:link, 'Profile').click
  sleep 1
  @page.edit.click
  @page.manage_emails.click
  @page.email_address.send_keys("zenprm#{random}@gmail.com")
  sleep 1
  @page.add_email_button.click
  sleep 1
  steps %Q{ * I should see "zenprm#{random}@gmail.com" on the page}
  email_count = @browser.all(:class, 'fa-times').count
  # if email_count == 2
  #   puts @browser.all(:class, 'fa-check-square-o').last.click
  #   @browser.switch_to.alert.accept
  # end
end

