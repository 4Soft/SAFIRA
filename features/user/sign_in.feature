Feature: Sign in

  As an user, I want to sign in to get access to the application.

    Scenario: User is not signed up
    	Given I do not exist as an user
      When I sign in with valid credentials
      Then I see an invalid login message

    Scenario: User signs in successfully
    	Given I exist as an user
    	When I sign in with valid credentials
    	Then I should be signed in

  	Scenario: User enters a wrong email
  		Given I exist as an user
  		When I sign in with a wrong email
  		Then I see an invalid login message

		Scenario: User enters a wrong password
			Given I exist as an user
			When I sign in with a wrong password
			Then I see an invalid login message


