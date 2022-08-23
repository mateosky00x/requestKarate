Feature: Service client POST
  As QA automation
  I want to create a client
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST Method
    * def requestCreate = {"name": '#(name)', "job": '#(job)'}
    * def responsePost = read('classpath:karate/request/createClient/responsePost_schemas.json')

    Given path 'users'
    And request requestCreate
    When method post
    Then status 201
    And match response == responsePost