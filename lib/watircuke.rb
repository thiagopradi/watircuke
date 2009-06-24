#
# Watircuke
#
# Commonly used watir steps
#
#
require 'cucumber'
require 'spec'

#
# Environment
#
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

#
# Cucumber
#
Before do
  @browser = Browser.new
end

#
# Browsing
#
Given /^I am on (.+)$/ do |page_name|
  @browser.goto(path_to(page_name))
end

When /^I (visit|go to) the (.+)$/ do |_, text|
  @browser.goto(@environment + text)
end

When /^I (click|follow) "([^\"]*)"$/ do |_, id|
  link = @browser.link(:text, id).click rescue @browser.link(:id, id).click
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(@browser.url).path.should == path_to(page_name)
end

#
# Should see
#
#
Then /^I should see "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_true
end

Then /^I should not see "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_false
end

# Then /^I should see "([^\"]*)" (\d+) times*$/ do |text, count|
#   res = @browser.body
#   (count.to_i - 1).times { res.sub!(/#{text}/, "")}
#   res.should contain(text)
#   res.sub(/#{text}/, "").should_not contain(text)
# end

Given /I verify the page contains a div class "(.*)"/ do |byclass|
  @browser.div(:class, byclass).exists?.should be_true
end

Given /I verify the page contains a div id "(.*)"/ do |id|
  @browser.div(:id, id).exists?.should be_true
end

Given /I verify the page contains a link class "(.*)"/ do |byclass|
  @browser.link(:class, byclass).exists?.should be_true
end

Given /I verify the page contains the image "(.*)"/ do |image|
  @browser.image(:src, image).exists?.should be_true
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  @browser.checkbox(label).should be_checked
end

#
# Forms
#
#
When /^I press "([^\"]*)"$/ do |b|
  @browser.button(:value, b).click
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  @browser.text_field(:name, field).set(value) rescue @browser.text_field(:id, field).set(value)
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, id|
  @browser.select_list(:id, id).select(value)
end

When /^I choose "([^\"]*)"$/ do |id|
  @browser.radio(:id, id).click
end

When /^I check "([^\"]*)"$/ do |id|
  @browser.checkbox(:id, id).click
end

When /^I uncheck "([^\"]*)"$/ do |id|
  @browser.checkbox(field).clear
end

#
# Javascript
#
Given /From the "(.*)" link I fire the "(.*)" event/  do |text, event|
  @browser.link(:text , text).fire_event(event)
end

Given /I click the "(.*)" span/  do |text|
  @browser.span(:text, text).click
end

Given /I wait (\d+) seconds*/ do |time|
  sleep time.to_i
end

Given /^I wait until "([^\"]*)"$/ do |div|
  7.times do |i|
    break if @browser.div(:id, div).exists?
    i == 7 ? raise(Watir::Exception::UnknownObjectException) : sleep(1)
  end
end
