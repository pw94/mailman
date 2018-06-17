Feature: Messages cannot be modified

   Created messages cannot be modified in the system

   Scenario: Browsing messages
    Given 3 created messages
    When I visit messages page
    Then I do not see edit button

   Scenario: Browsing messages details
    Given Created message
    When I visit details page
    Then I see links to the records