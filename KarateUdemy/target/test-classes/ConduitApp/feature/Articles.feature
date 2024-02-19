Feature: Articles

  Background: Define URL
    Given url apiUrl


  Scenario: Create a new article
    Given path 'articles'
    And request {"article": {"title": "HellomynameisAnshika1000666678","description": "Please this should work","body": "Hellooo","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == "HellomynameisAnshika1000666678"


  Scenario: Create and delete article
    Given path 'articles'
    And request {"article": {"title": "HellomynameisAnshika09242002","description": "Please this should work","body": "Hellooo","tagList": []}}
    When method Post
    Then status 201
    * articleId=response.article.slug


    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title == "HellomynameisAnshika09242002"


    Given path 'articles',articleId
    When method Delete
    Then status 204

    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != "HellomynameisAnshika09242002"


