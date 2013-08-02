Feature: Invite enterprise

  As an administrator, I want to invite enterprises by email so they can register into the application.

    Scenario: Send email
      Given I fill a form with valid name and email
      When I send a invitation
      Then the invitation must be done

    Scenario: Send email
      Given I left a field on form with a invalid or blank data  
      When I Send a invitation
      Then I should receive a message of invalid field