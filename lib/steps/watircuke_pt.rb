
Given /^Eu estou em (.+)$/ do |page_name|
  @browser.goto(path_to(page_name))
end

When /^Eu (visito|vou) para (.+)$/ do |_, text|
  @browser.goto(@environment + text)
end

When /^Eu (clico|sigo) "([^\"]*)"$/ do |_, id|
  link = @browser.link(:text, id).click rescue @browser.link(:id, id).click
end

Then /^Eu devo estar em (.+)$/ do |page_name|
  URI.parse(@browser.url).path.should == path_to(page_name)
end

#
# Devo ver
#
#
Then /^Eu devo ver "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_true
end

Then /^Eu não devo ver "([^\"]*)"$/ do |text|
  @browser.contains_text(text).should be_false
end

# Then /^I should see "([^\"]*)" (\d+) times*$/ do |text, count|
#   res = @browser.body
#   (count.to_i - 1).times { res.sub!(/#{text}/, "")}
#   res.should contain(text)
#   res.sub(/#{text}/, "").should_not contain(text)
# end

Given /Eu verifico que a página contêm uma div com a class "(.*)"/ do |byclass|
  @browser.div(:class, byclass).exists?.should be_true
end

Given /Eu verifico que a página contêm uma div com a id "(.*)"/ do |id|
  @browser.div(:id, id).exists?.should be_true
end

Given /Eu verifico que a página contêm um link com a class "(.*)"/ do |byclass|
  @browser.link(:class, byclass).exists?.should be_true
end

Given /Eu verifico que a página contêm a imagem "(.*)"/ do |image|
  @browser.image(:src, image).exists?.should be_true
end

Then /^o checkbox "([^\"]*)" deve estar marcado$/ do |label|
  @browser.checkbox(label).should be_checked
end

#
# Formulários
#
#
When /^Eu pressiono "([^\"]*)"$/ do |b|
  @browser.button(:value, b).click
end

When /^Eu preeencho "([^\"]*)" com "([^\"]*)"$/ do |field, value|
  @browser.text_field(:name, field).set(value) rescue @browser.text_field(:id, field).set(value)
end

When /^Eu seleciono "([^\"]*)" em "([^\"]*)"$/ do |value, id|
  @browser.select_list(:id, id).select(value)
end

When /^Eu seleciono "([^\"]*)"$/ do |id|
  @browser.radio(:id, id).click
end

When /^Eu marco "([^\"]*)"$/ do |id|
  @browser.checkbox(:id, id).click
end

When /^Eu desmarco "([^\"]*)"$/ do |id|
  @browser.checkbox(field).clear
end

#
# Javascript
#
Given /Do link "(.*)" Eu chamo o evento "(.*)"/  do |text, event|
  @browser.link(:text , text).fire_event(event)
end

Given /Eu clico no span "(.*)"/  do |text|
  @browser.span(:text, text).click
end

Given /Eu espero por (\d+) segundos*/ do |time|
  sleep time.to_i
end

Given /^Eu espero até "([^\"]*)"$/ do |div|
  7.times do |i|
    break if @browser.div(:id, div).exists?
    i == 7 ? raise(Watir::Exception::UnknownObjectException) : sleep(1)
  end
end

