Feature: Decode a VIN in the vPIC web decoder
  As a member of the public checking a vehicle
  I want the vPIC web decoder to show the vehicle's make, model and model year
  So that I can confirm a VIN before relying on it

  @ui @testrail:C28
  Scenario: A known VIN shows its make, model and model year
    Given I open the vPIC VIN decoder
    When I decode the VIN "1HGCM82633A004352" in the web decoder
    Then the web decoder shows make "HONDA", model "Accord" and model year "2003"

  @ui @testrail:C29
  Scenario: The web decoder shows the same make, model and model year as the vPIC API
    Given I open the vPIC VIN decoder
    When I decode the VIN "1HGCM82633A004352" in the web decoder
    And I decode the VIN "1HGCM82633A004352"
    Then the response status is 200
    And the web decoder shows the same make, model and model year as the API

  @ui @testrail:C30
  Scenario: An invalid VIN shows the decoder's error text
    Given I open the vPIC VIN decoder
    When I decode the VIN "1HGCM826X3A00435Z" in the web decoder
    Then the web decoder shows a non-blank "Error Text"
