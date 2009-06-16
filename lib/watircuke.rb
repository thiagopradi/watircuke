require "cucumber"
#require File.join(File.dirname(__FILE__), '..', 'features', 'support', 'env')
# Dir[File.join(File.dirname(__FILE__), '..', 'features', 'step_definitions', '*rb')].each { |file| require file }
require 'spec'

if ENV['FIREWATIR']
  require 'firewatir'
  Browser = FireWatir::Firefox
else
  case RUBY_PLATFORM
  when /darwin|i686-linux/
    require 'firewatir'
    Browser = FireWatir::Firefox
    # require 'safariwatir'
    # Browser = Watir::Safari
  when /win32|mingw/
    require 'watir'
    Browser = Watir::IE
  when /java/
    require 'celerity'
    Browser = Celerity::Browser
  else
    raise "This platform is not supported (#{PLATFORM})"
  end
end


 # "before all"
 browser = Browser.new

 Before do
   @browser = browser
   @environment = "http://github.com/"
   sleep 3
 end


When /^I press "([^\"]*)"$/ do |b|
  @browser.button(:value, b).click
end

When /^I follow "([^\"]*)"$/ do |l|
  @browser.link(:text, l).click
end

When /^I (visit|go to) "(.+)"$/ do |text|
  @browser.goto(@environment + text)
end

Given /^I am on (.+)$/ do |page_name|
  @browser.goto(path_to(page_name))
end

#
# Should see
#
Then /^I should see "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_true
end

Then /^I should not see "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_false
end

Then /^I should not see "([^\"]*)"$/ do |text|
  response.should_not contain(text)
end

Then /^I should see "([^\"]*)" (\d+) times*$/ do |text, count|
  res = response.body
  (count.to_i - 1).times { res.sub!(/#{text}/, "")}
  res.should contain(text)
  res.sub(/#{text}/, "").should_not contain(text)
end

Given /I verify the page contains a div class "(.*)"/ do |byclass|
  assert(@browser.div(:class, byclass).exists?)
end

Given /I verify the page contains a div id "(.*)"/ do |id|
  assert(@browser.div(:id, id).exists?)
end

Given /I verify the page contains a link class "(.*)"/ do |byclass|
  assert(@browser.link(:class, byclass).exists?)
end

Given /I verify the page contains the image "(.*)"/ do |image|
  assert(@browser.image(:src, image).exists?)
end

#
# Forms
#
When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  @browser.text_field(:name, field).set(value)
end

# When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
#   select(value, :from => field)
# end

# Given /I click the "(.*)" checkbox/ do |id|
#   @browser.checkbox(:id, id).click
# end

Given /I click the "(.*)" radio button/ do |id|
  @browser.radio(:id, id).click
end

Given /I select "(.*)" from the select list "(.*)"/ do |value, id|
  @browser.select_list(:id, id).select(value)
end

Given /From the "(.*)" link I fire the "(.*)" event/  do |text, event|
  @browser.link(:text , text).fire_event(event)
end

Given /I wait "(.*)" seconds/ do |time|
  sleep time.to_i
end

Given /I click the "(.*)" span/  do |text|
  @browser.span(:text, text).click
end
