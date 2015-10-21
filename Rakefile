require 'bundler'
# require 'gmail'
# require 'hipchat'
# require 'dropbox_sdk'

namespace :alpha do
  desc "Run Full Stack Test Builds in multiple browsers against zenprmalpha.ahealthtech.com."
  task :build, [:browser] do |t, args|
      Bundler.with_clean_env do
      console_output = ""
      IO.popen("thor set:#{args[:browser]} && cucumber --format html --out=latest_#{args[:browser]}_build.html --format pretty", 'r+') do |pipe|
        puts console_output = pipe.read
        pipe.close_write
      end
    end  
  end
end