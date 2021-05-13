
Feature: Article functionality
  @bbc
    # object : verify that user can create article
#     pre-condition
#   test data:
#    - username: qa2021,
#    - password: bblog2021
#    - email:chaoukiqa.come
#    - env: qa-task.backbasecloud
#   user has one or more than one article
#   user be able to select favorite articles
  Scenario: user create article
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user goes to "new post page
    And the user fills "Article Title" with "title 1"
    And the user fills "what is article about" with "testing 1"
    And the user fills "write your article" with "article for test 1"
    And the user fills "enter tags" with "qa"
    And the user clicks on "publish Article" button
    Then the user should see "test" page
    And the user should see date today

#  Scenario: user can create more multiple articles
#    Given User navigate to login page
#    When the user "chaouki" logs in with password "bblog2021"
#    And the user goes to "new post page
#    And the user fills "Article Title" with "title 1"
#    And the user fills "what is article about" with "testing 1"
#    And the user fills "write your article" with "article for test 1"
#    And the user fills "enter tags" with "qa"
#    And the user clicks on "publish Article" button
#    Then the user should see "test" page
#    And the user should see date today

  Scenario: verify that when user logs in should be on "Your Feed" tab
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    Then the user should see "Your Feed" tab
    And the user should be on "Your Feed" tab

  Scenario: verify that user can see his article in global feed
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user clicks on "Global Feed" tab
    Then the user should see his article under his username "qa2021"
    And the user should see his article with "title 1" title

  Scenario: user navigate to article page
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user clicks on "Global Feed" tab
    And the user clicks on "qa2021"
    Then the user should be on "qa2021" profile page
    And the user should be on "My Articles" tab

# object : verify that user can edit/mark favorite article
#     pre-condition
#   test data:
#    - username: qa2021,
#    - password: bblog2021
#    - email:chaoukiqa.come
#    - env: qa-task.backbasecloud
#   user has one or more than one article
#   user be able to select favorite articles


  Scenario: user edit article
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user navigate to "title 1" article page
    Then the user should see "Edit Article" button
    When the user clicks on "Edit Article" button
    Then the user should see all article details
    And the user should be able to edit article details
    And the user fills "Article Title" with "title 2"
    And the user fills "write your article" with "article for test 2"
    And the user fills "enter tags" with "qa"
    When the user clicks on "publish Article" button
    Then the user should be on "title 2" page

  Scenario:  user select favorited articles
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user navigate to "qa2021" profile page
    And the user clicks on "favorited" button for "title 2" article
    Then the user should see "1" on favorite button
    When the user clicks on "Favorited Articles" tab
    Then the user should see "title 2" article




# object : verify that user can delete article
#     pre-condition
#   test data:
#    - username: qa2021,
#    - password: bblog2021
#    - email:chaoukiqa.come
#    - env: qa-task.backbasecloud
#   user has more than one article
#   user has only one article
  Scenario: user has more than one article and delete one article
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user navigate to "title 2" article page
    Then the user should see "Delete Article" button
    When the user clicks on "Delete Article" button
    Then the user should see "Aplace to share you knowledge"
    And the use should be on "Your Feed" tab

  Scenario: user has one articles and delete it
    Given User navigate to login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user navigate to "title 2" article page
    Then the user should see "Delete Article" button
    When the user clicks on "Delete Article" button
    Then the user should see "Aplace to share you knowledge"
    And the use should be on "Your Feed" tab
    Then the user should not see "title 2" article
    And the user should see "No articles are here... yet"
    When the user clicks on "Favorited Articles" tab
    Then the user should not see "title 2" article
    And the user should see "No articles are here... yet"



  Scenario: user select favorited articles
    Given


