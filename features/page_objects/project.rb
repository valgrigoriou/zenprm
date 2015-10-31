class Project
  include PageObject
  
  def archived_projects
    @browser.first(:link, 'Archived Projects')
  end
  
  def visit_projects_tab
  Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:link, 'Projects')}
  @browser.first(:link, 'Projects').click
  end
end