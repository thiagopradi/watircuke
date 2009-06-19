require File.expand_path(File.dirname(__FILE__) + '/../../lib/watircuke')

Before do
  @environment = "http://github.com/"
#  sleep 1
end

# "after all"
at_exit do
  @browser.close if @browser
end
