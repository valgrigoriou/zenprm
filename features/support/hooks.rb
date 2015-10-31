Before do
  @profile = Profile.new(@browser)
  @login = Login.new(@browser)
  @sidebar = SideBar.new(@browser)
  @project = Project.new(@browser)
  @forgot_password = ForgotPassword.new(@browser)
end

AfterStep do
  # raise "BOOM ~ found something in the Browser JS Console ~ #{@browser.manage.logs.get("browser")}"
end