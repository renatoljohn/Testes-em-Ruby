Given('I fill in {string} with {string}') do |field, value|
    CommonMethods.fill_in(field, with: value)
end

Then('I expect to see {string} text') do |text|
    CommonMethods.assert_text(text)
end