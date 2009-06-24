require 'spec'
require File.expand_path(File.dirname(__FILE__) + '/paths')

if ENV['CUC_ENV'] == 'webrat'
  require 'webrat/core/matchers'
  require File.expand_path(File.dirname(__FILE__) + '/../../lib/webratcuke')
else
  require File.expand_path(File.dirname(__FILE__) + '/../../lib/watircuke')

  Before do
    @environment = "http://github.com/"
    #  sleep 1
  end

  # FIXME: this doesn't work
  # After do
  #   @browser.close if @browser
  # end

end
