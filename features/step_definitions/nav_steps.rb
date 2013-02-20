Then /^the ([\w\s]+) menu item should (not )?be selected$/ do |name, negate|
  expectation = negate ? :should_not : :should
  doc = Nokogiri::HTML(@browser.last_response.body)
  selected = doc.css('li.selected').map(&:content).join
  selected.send(expectation, match(name))
end
