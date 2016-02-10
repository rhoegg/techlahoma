Feature: Oauth Application Management
  Should be useable by admins
  But not by non-admins

  @omniauth_test
  #@javascript
  Scenario: As a non-admin
    Given a signed in user
    When they visit the oauth path
    Then they should not see "Your applications"
    Then they should see "Techlahoma"

  @omniauth_test
  Scenario: As an admin
    Given a signed in admin user
    When they visit the oauth path
    Then they should see "Your applications"
    Then they should not see "Techlahoma"
