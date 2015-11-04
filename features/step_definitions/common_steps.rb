Given /I should (NOT )?be on the "(.*)" page/ do |visibility, value|
  url = @browser.current_url.to_s
  if (visibility.to_s.strip == 'NOT') then
     url.should_not include value
  else
    Selenium::WebDriver::Wait.new(:timeout => 15).until {@browser.current_url.to_s.should include value}
  end
end

Given /I should (NOT )?see "(.*)" on the page/i do |visibility, text|
  sleep 1
  text = text.to_s.strip
  if (visibility.to_s.strip == 'NOT') then
    @browser.find_element(:tag_name => "body").text.should_not include("#{text}")
  else
    @browser.find_element(:tag_name => "body").text.should include("#{text}")
  end
end

Given /I should see "(.*)" for the alert message/i do |alert_style|
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.first(:class, 'close')}
  @browser.find_element(css: ".growl-container div").attribute('class').should include alert_style
  @browser.first(:class, 'close').click unless @browser.first(:class, 'close').displayed? == false  
end