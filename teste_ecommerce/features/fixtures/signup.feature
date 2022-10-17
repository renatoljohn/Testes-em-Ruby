@signup
Feature: SignUp Validations on Spree Demo E-Commerce

    Background: Be on Spree Demo SignUp Page
        Given I am on "https://demo.spreecommerce.org/"
        And I click on "account_button"
        And I click on "signup_dropdown"

    @success
    Scenario: SignUp with a new User With Success
        And I fill in "signup_email_field" with "<%= rand().to_s[2..-1] %>@putsbox.com"
        And I fill in "signup_pass_field" with "Dummy@Pass3!"
        And I fill in "signup_pass_confirm_field" with "Dummy@Pass3!"
        When I click on "submit_button"
        Then I expect to see "<%= @signup_email_field %>" text

    @nested_steps @success
    Scenario: SignUp with a new User With Success using Nested Steps
        When I submit a user form with email "<%= rand().to_s[2..-1] %>@putsbox.com" and password "Dummy@Pass3!"
        Then I expect to see "<%= @signup_email_field %>" text

    @invalid
    Scenario: Invalid SignUp Attempt with Invalid Email
        And I fill in "signup_email_field" with "notavalidemail"
        And I fill in "signup_pass_field" with "Dummy@Pass3!"
        And I fill in "signup_pass_confirm_field" with "Dummy@Pass3!"
        When I click on "submit_button"
        Then I expect to see "signup_pass_confirm_field" element

    @invalid
    Scenario: Invalid SignUp Attempt with Passwords that Does Not Matches
        And I fill in "signup_email_field" with "<%= rand().to_s[2..-1] %>@putsbox.com"
        And I fill in "signup_pass_field" with "Dummy@Pass3!"
        And I fill in "signup_pass_confirm_field" with "Dummy@WrongPass!"
        When I click on "submit_button"
        Then I expect to see "Password Confirmation doesn't match Password" text

    @invalid
    Scenario: Invalid SignUp Attempt without Filling Required Fields
        And I fill in "signup_pass_field" with "Dummy@Pass3!"
        And I fill in "signup_pass_confirm_field" with "Dummy@Pass3!"
        When I click on "submit_button"
        Then I expect to see "Email can't be blank" text

    @invalid @scenario_outline
    Scenario Outline: Invalid SignUp Attempt with Invalid Email
        And I fill in "signup_email_field" with "<invalid_email_variation>"
        And I fill in "signup_pass_field" with "<user_password>"
        And I fill in "signup_pass_field" with "<user_password>"
        When I click on "submit_button"
        Then I expect to see "signup_pass_confirm_field" element
    Examples:
    |  invalid_email_variation | user_password |
    |  invalidemail            | Dummy@Pass3!  |
    |  invalid@email@com       | Dummy@Pass3!  |
    |  1                       | Dummy@Pass3!  |