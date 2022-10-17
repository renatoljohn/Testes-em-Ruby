When('I submit a user form with email {string} and password {string}') do |email, password|
    steps %(
        * I fill in "signup_email_field" with "#{email}"
        * I fill in "signup_pass_field" with "#{password}"
        * I fill in "signup_pass_confirm_field" with "#{password}"
        * I click on "submit_button" 
    )
end