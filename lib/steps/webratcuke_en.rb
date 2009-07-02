# Watircuke
#
# Commonly used webrat steps
# http://github.com/brynary/webrat
#

#
# Browsing
#
#
Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

#
# Should see
#
#
Then /^I should see "([^\"]*)"$/ do |text|
  response.should contain(text)
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

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end

Then /^I should see a (\S+) in the (\S+)$/ do |element, containing_element|
  response.should have_tag("##{containing_element} .#{element}")
end

Then /^I should see the (\S+) in the (\S+)$/ do |element, containing_element|
  response.should have_tag("##{containing_element} ##{element}")
end

Then /^I should see (\d+) (\S+) in the (\S+)$/ do |count, element, containing_element|
  response.should have_tag("##{containing_element} .#{element.singularize}",:count => count.to_i)
end

Then /^I should see (\d+) to (\d+) (\S+) in the (\S+)$/ do |min, max, element, containing_element|
  response.should have_tag("##{containing_element} .#{element.singularize}",min.to_i..max.to_i)
end

Then /^the (\S+) in the (\S+) should contain (a|an|the) (\S+)$/ do |middle_element, outer_element, a, inner_element|
  response.should have_tag("##{outer_element} .#{middle_element} .#{inner_element}")
end

Then /^I should see the (\S+)$/ do |element_id|
  response.should have_tag("##{element_id}")
end

Then /^I should see (a|an) (\S+)$/ do |a, element_class|
  response.should have_tag(".#{element_class}")
end


#
# Forms
#
#
When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time
When /^I select "([^\"]*)" as the date and time$/ do |time|
  select_datetime(time)
end

When /^I (press|follow|check|uncheck|choose) "([^\"]*)" for (.*) whose (.*) is "([^\"]*)"$/ do |action, whatyouclick, class_name, var_name, value|
  id = var_name == "id" ? value : eval("\"#{class_name}\".classify.constantize.find_by_#{var_name}(\"#{value}\").id.to_s")
  within("tr[id=row_#{class_name}_#{id}]") do
    case action
      when "press"   then   click_button(whatyouclick)
      when "follow"  then   click_link(whatyouclick)
      when "check"   then   check(whatyouclick)
      when "uncheck" then   uncheck(whatyouclick)
      when "choose"  then   uncheck(whatyouclick)
    end
  end
end


# Use this step when using multiple datetime_select helpers on a page or
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
When /^I select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it.
When /^I select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^I select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^I select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^I select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end


# Steps that are generally useful and help encourage use of semantic
# IDs and Class Names in your markup. In the steps below, a match following
# "the" will verify the presences of an element with a given ID while a match following
# "a" or "an" will verify the presence an element of a given class.
Then /^I debug$/ do
  debugger
end

Then /^save_and_open_page$/ do
  save_and_open_page
end

Then /^I wait for ([0-9]+) seconds$/ do |delay|
  sleep delay.to_i
end

