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
  @sidebar.settings_button.click
  @sidebar.profile_link.click
  @profile.edit.click
  @profile.manage_emails.click
  @edit_email.email_address("zenprm#{random}@gmail.com")
  @edit_email.add_email_button.click
  email_count = @browser.all(:class, 'fa-times').count
  if email_count > 2
    puts @browser.all(:class, 'fa-times').last.click
    @browser.switch_to.alert.accept
  end
end

