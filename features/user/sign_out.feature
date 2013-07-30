Feature: Sign out
	
	As an user, I want to sign out from the application, to leave my session from the actual connection.

	Scenario: Successfull sign out
		Given I exist as an user and I'm signed in
		When I sign out
		Then I should see a signed out message
		When I return to the application
		Then I should be signed out

