class Dashboard
  include PageObject
  
  def visit_page
    @browser.get($domain + "/#/")
  end
end