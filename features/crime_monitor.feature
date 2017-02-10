Feature: Neighbourhood crime moinitor
  As a resident
  I want to keep eye on my area
  So that I can monitor crimes rates
  
  @javascript
  Scenario: Search crimes in my postcode
    Given I am on the home page
    When I provide my postcode L7 3ET
    Then I should see "Total Crimes"
