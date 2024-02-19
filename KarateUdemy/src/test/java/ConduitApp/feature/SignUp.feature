
Feature: Sign Up New User
  Background:
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url apiUrl



  Scenario: New user sign Up
    * def randomEmail = dataGenerator.GetRandomEmail();
    * def randomUsername = dataGenerator.GetRandomUserName()

    * def jsFunction =
    """
      function(){
        var DataGenerator = Java.type('helpers.DataGenerator')
        var generator=new DataGenerator()
        return generator.GetRandomUserName2()
      }
    """
    * def randomUsername2 = call jsFunction
    Given path 'users'
    And request
    """
    {
      "user": {
          "email": "#(randomEmail)",
          "password": "1234",
          "username": "#(randomUsername2)"
    }
}
    """
    When method Post
    Then status 201
    And match response ==
    """
    {
    "user": {
        "id": "#number",
        "email": "#(randomEmail)",
        "username": "#(randomUsername2)",
        "bio": "##string",
        "image": "#string",
        "token": "#string"
    }
}
    """
@debug
  Scenario Outline: Validate Sign Up Error Messages
    * def randomEmail = dataGenerator.GetRandomEmail();
    * def randomUsername = dataGenerator.GetRandomUserName()

    Given path 'users'
    And request
    """
      {
        "user": {
          "email": "<email>",
          "password": "<password>",
          "username": "<username>"
        }
      }
    """
    When method Post
    Then status 422
    And match response == "<errorResponse>"

    Examples:
      | email            | password | username | errorResponse                                      |
      | #(randomEmail) | 1234     | Anshika1 | {"errors":{"username":["has already been taken"]}} |