Feature: Github

  Scenario: search for cucumber at github
    Given I am on the cucumber page
    Then I should see "BDD that talks to domain experts first and code second"
    When I fill in "q" with "watircuke"
    And I press "Search"
    And I select "Code" from "type_value"
    Then I should see "Repositories"
    When I follow "richdownie / watircuke"
    Then I should see "H30 (watir, safariwatir, firewatir)"
