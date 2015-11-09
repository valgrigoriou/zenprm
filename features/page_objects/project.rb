class Project
  include PageObject
  
  def archived_projects
    @browser.first(:link, 'Archived Projects')
  end
  
  def projects
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:id, 'Projects')}
    @browser.find_element(:id, 'Projects')
  end
  
  def visit_projects_tab
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.find_element(:link, 'Projects')}
    @browser.first(:link, 'Projects').click
  end
  
  def visit_first_project
    Selenium::WebDriver::Wait.new(:timeout => 5).until {self.projects.find_element(:class, 'ng-binding')}
    puts self.projects.all(:class, 'ng-binding').first.click
  end
end