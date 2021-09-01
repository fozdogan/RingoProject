@regressionSuite @register
Feature: Invalid Registration

  @invalid @smoke
  Scenario Outline: Register with an invalid email
    Given Customer is on the register page
    When Customer enters <mobileNumber>, <email> and <password>
    And Customer click to updates buttons and Terms & Conditions
    Then Customer should see <error> messages
    Examples:
      | error                     | mobileNumber | email         | password   |
      | Email address is invalid  | 1298765432   | @gmail.com    | Mypassword |
      | Email address is invalid  | 1987654321   | cft@com       | Mypassword |
      | Email address is invalid  | 9876543210   | asd@gmail.    | Mypassword |
      | Email address is invalid  | 8976543218   | mny/gmail.com | Mypassword |
      | Email address is required | 6543210987   |               | Mypassword |


  @invalid @smoke
  Scenario Outline: Register with an invalid password
    Given Customer is on the register page
    When Customer enters <mobileNumber>, <email> and <password>
    And Customer click to updates buttons and Terms & Conditions
    Then Customer should see <error> messages
    Examples:
      | error                                          | mobileNumber | email               | password  |
      | The password does not meet the correct format. | 1987654321   | alex@gmail.com      | ypassword |
      | The password does not meet the correct format. | 9876543210   | juniorsep@gmail.com | Mypasswo  |
      | The password does not meet the correct format. | 8976543218   | mark@gmail.com      | Mysword   |
      | Password is required                           | 6543210987   | rodrigez@gmail.com  |           |

  @invalid @smoke
  Scenario Outline: Register with an invalid mobile number
    Given Customer is on the register page
    When Customer enters <mobileNumber>, <email> and <password>
    And Customer click to updates buttons and Terms & Conditions
    Then Customer should see <error> messages
    Examples:
      | error                                             | mobileNumber    | email                | password       |
      | Mobile number must be numeric                     | 876543dk2       | daniel@gmail.com     | Mypasswo       |
      | Mobile number must be numeric                     | ?467            | joseph@gmail.com     | Mypassword11   |
      | Mobile number must be numeric                     | bnmhye          | jonson@gmail.com     | 23Mypassword   |
      | Telephone number must be longer than 9 characters | 873             | maria@gmail.com      | Mypas123sword  |
      | Telephone number must be 13 or less characters    | 564321897002345 | bidenbar@hotmail.com | 12Mypassword56 |
      | Mobile number is required                         |                 | maxima@gmail.com     | Mypassword0982 |



