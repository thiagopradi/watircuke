require "cucumber"
require File.join(File.dirname(__FILE__), '..', 'features', 'support', 'env')
Dir[File.join(File.dirname(__FILE__), '..', 'features', 'step_definitions', '*rb')].each { |file| require file }
