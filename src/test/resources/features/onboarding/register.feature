@regressionSuite @register
Feature: Registration

  @smoke @valid
  Scenario Outline: Register as a RingGo account
    Given Customer is on the register page
    When Customer enters <mobileNumber>, <email> and <password>
    And Customer click to updates buttons and Terms & Conditions
    Then Customer should see login page
    Examples:
      | mobileNumber | email         | password   |
      | 9012345678   | abc@gmail.com | Mypassword |
