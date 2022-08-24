Feature: Service client POST
  As QA automation
  I want to log in
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST Method

    * def requestPost = read('classpath:karate/request/loginUser/requestPostLogin_schemas.json')
    * def responsePost = read('classpath:karate/request/loginUser/responsePostLogin_schemas.json')

    Given path 'register'
    And request requestPost
    When method post
    Then status 200
    And match response == responsePost


  Scenario Outline: invalid login
    * def password = '<password>'
    * def responseWrongLogin = read('classpath:karate/request/loginUser/responseWrongLogin_schemas.json')
    Given path 'register'
    And request

    """
    {
      "email": "sydney@fife",
      "password": <password>
    }
    """
    When method post
    Then status 400
    And match response == responseWrongLogin

    Examples:
      | password      |
      | ""            |
      | wrongpassword |


