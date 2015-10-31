Given /I view my existing projects/i do
  @project.visit_projects_tab
end

Given /I should see exisiting projects/i do
  raise "Projects do not display on the page" unless @page.archived_projects.displayed? == true
end