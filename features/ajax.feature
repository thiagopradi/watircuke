Feature: Github

  Scenario: ajaxy test
    Given I am on the watircuke page
    And I click "download_button"
    And I wait until "facebox"
    And I wait until "archives"
    Then I should see "Download richdownie/watircuke at master "
