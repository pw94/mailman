Feature: Records can be share

   Owner of the record can share it with other users

   Scenario: Owner shares record
    Given Owned record in the database
    When I share it with another user
    Then I see him in the record's Users section

   Scenario: User cannot share unowned record
    Given Accessible record in the database
    When I open its details page
    Then I cannot share it
    And I cannot see Users section