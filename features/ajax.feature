Feature: Ajax

  @watir
  Scenario: ajaxy test
    Given I am on the watircuke page
    And I click "download_button"
    And I wait until "facebox"
    And I wait until "archives"
    Then I should see "Download richdownie/watircuke at master "

  @watir
  Scenario: ajaxy search
    Given I am on bing
    And I fill in "q" with "cucu"
    Then I should see "cucumber"
