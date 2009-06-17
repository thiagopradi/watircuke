require 'spec'
#require 'cucumber/rails/rspec'
require 'webrat/core/matchers'

require File.expand_path(File.dirname(__FILE__) + '/../../lib/watircuke')

Before do
  @environment = "http://github.com/"
#  sleep 1
end

# "after all"
at_exit do
 # @browser.close
end
