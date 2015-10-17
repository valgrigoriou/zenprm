class Set < Thor
  include Thor::Actions

  @@appliance_host = ENV['CI_QA_VM'] || 'triage.vm' 
  
  no_tasks do
    def copy_environment(new_environment)
      run("cp features/support/browser_configurations/hooks.rb.#{new_environment} features/support/hooks.rb")
    end
  end
  
  desc "chrome", "Use chrome locally"
  def chrome
    copy_environment("chrome")
  end
  
  desc "edit", "Use chrome locally in EDIT Mode"
  def edit
    copy_environment("edit")
  end

  desc "firefox", "Use fireFox locally"
  def firefox
    copy_environment("firefox")
  end

  # desc "safari", "Use safari locally"
  # def safari
  #   copy_environment("safari")
  # end
  
  # desc "IE10", "Use SauceLabs Internet Explorer 10"
 #  def IE10
 #    copy_environment("IE10")
 #  end
  
  # desc "IE11", "Use SauceLabs Internet Explorer 11 on Windows 10 platform"
  # def IE11
  #   copy_environment("IE11")
  # end
end