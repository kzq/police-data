Feature: Neighbourhood crime moinitor
  As a resident
  I want to keep eye on my area
  So that I can monitor crimes rates in my neighbourhood
  
  Scenario: Display crimes statistics
    Given I am on the homepage
    When I provide my postcode
    Then I should see crimes rates of my postcode
    
      