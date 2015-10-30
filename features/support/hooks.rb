Before do
  @profile = Profile.new(@browser)
  @login = Login.new(@browser)
end

AfterStep do
  puts @browser.manage.logs.get("browser") unless @browser.manage.logs.get("browser") == []
end