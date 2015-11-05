Before do
  @profile = Profile.new(@browser)
  @login = Login.new(@browser)
  @sidebar = SideBar.new(@browser)
  @project = Project.new(@browser)
  @forgot_password = ForgotPassword.new(@browser)
  @edit_email = EditEmail.new(@browser)
end

AfterStep do
  if @browser.manage.logs.get("browser").inspect =~ /WARNING/
    puts @browser.manage.logs.get("browser").inspect 
    #go to the next step
  elsif @browser.manage.logs.get("browser") == []
    #go to the next step
  else
    raise "BOOM ~ found something in the Browser JS Console ~ #{@browser.manage.logs.get("browser")}"
  end
end