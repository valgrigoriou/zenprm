Before do
  @profile = Profile.new(@browser)
  @login = Login.new(@browser)
end

AfterStep do
  puts browser_console = @browser.manage.logs.get("browser").inspect
  # if @browser.manage.logs.get("browser") == []
  #   #go to the next step
  # elsif @browser.manage.logs.get("browser") != []
  #   raise "BOOM ~ found something in the Browser JS Console ~ #{@browser.manage.logs.get("browser")}"
  # end
end