Given('I am on {string}') do |site|
    visit(site)
end

When('I click on {string}') do |element|
    find(EL[element]).click
end

Then('I expect to see {string} element') do |element|
    assert_selector(EL[element])
end