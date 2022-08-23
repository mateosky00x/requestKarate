Feature: Service client GET
  As Qa Automation
  I want to consult a client
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: Check the service get method
    * def responseGet = read('classpath:karate/request/consultClient/responseGet_schemas.json')
    Given path 'users','2'
    When method get
    Then status 200
    And match response == responseGet
    And assert response.support.text == "To keep ReqRes free, contributions towards server costs are appreciated!"
    And assert response.data.email == email
    And assert response.data.first_name == first_name
    And assert response.data.last_name == last_name
    And assert response.data.avatar == avatar

  Scenario Outline: Users that don't exist in data

    Given path 'users', <idUser>
    When method get
    Then status <statusCode>

    Examples:
      | idUser        | statusCode |
      | 8855665       | 404        |
      | "#-*/*"       | 404        |
      | "mateoTester" | 404        |
      | 23.322        | 404        |