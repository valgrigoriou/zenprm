class Project
  include PageObject
  
  def archived_projects
    @browser.first(:link, 'Archived Projects')
  end
  
  def visit_page
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:link, 'Projects')}
  @browser.first(:link, 'Projects').click
  end
end

Given /I am on the projects page/i do
  @page = Project.new(@browser)
  @page.visit_page
end

Given /I should see exisiting projects/i do
  raise "Projects do not display on the page" unless @page.archived_projects.displayed? == true
end