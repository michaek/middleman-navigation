Then /^the ([\w]+) menu item should (not )?be selected$/ do |name, negate|
  expectation = negate ? :should_not : :should
  doc = Nokogiri::HTML(@browser.last_response.body)
  selected = doc.css('li.selected').first
  selected.content.send(expectation, match(name))
end
