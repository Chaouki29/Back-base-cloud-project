Feature: Article functionality

  Background:
    Given User on login page
    When the user "chaouki" logs in with password "bblog2021"

    # object : verify that user can navigate/create article
#     pre-condition
#   user has one or more than one article
#   user be able to select favorite articles
  Scenario: user navigate to article page
    When the user clicks on "Global Feed" tab
    And the user clicks on "qa2021" link
    Then the user should be on "qa2021" profile
    And the user should be on "My Articles" tab

  Scenario: user create article
    When the user goes to "new post" page
    And the user fills "Article Title" with "title 1"
    And the user fills "what is article about" with "testing 1"
    And the user fills "write your article" with "article for test 1"
    And the user fills "enter tags" with "qa"
    And the user clicks on "publish Article" button
    Then the user should see "test" page
    And the user should see date today

  Scenario Outline: user can create more multiple articles
    When the user goes to "new post" page
    And the user fills "Article Title" with "<title>"
    And the user fills "what is article about" with "<object>"
    And the user fills "write your article" with "<article text>"
    And the user fills "enter tags" with "<tag>"
    And the user clicks on "publish Article" button
    Then the user should see "test" page
    And the user should see date today
    Examples:
      | title   | object    | article text       | tag |
      | title 1 | testing 1 | article for test 1 | qa1 |
      | title 2 | testing 2 | article for test 2 | qa2 |
      | title 3 | testing 3 | article for test 3 | qa3 |

  Scenario: verify that when user logs in should be on "Your Feed" tab
    Given User on login page
    When the user "chaouki" logs in with password "bblog2021"
    Then the user should see "Your Feed" tab
    And the user should be on "Your Feed" tab

  Scenario: verify that user can see his article in global feed
    Given User on login page
    When the user "chaouki" logs in with password "bblog2021"
    And the user clicks on "Global Feed" tab
    Then the user should see his article under his username "qa2021"
    And the user should see his article with "title 1" title


# object : verify that user can edit/mark favorite article
#     pre-condition
#   user has one or more than one article
#   user be able to select favorite articles

  Scenario: user edit article
    When the user navigate to "title 1" article
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
    When the user navigate to "qa2021" profile
    And the user clicks on "favorited" button for "title 2" article
    Then the user should see "1" on favorite button
    When the user clicks on "Favorited Articles" tab
    Then the user should see "title 2" article

# object : verify that user can delete article
#     pre-condition
#   user has more than one article
#   user has only one article
  Scenario: user has more than one article and delete one article
    When the user navigate to "title 2" article
    Then the user should see "Delete Article" button
    When the user clicks on "Delete Article" button
    Then the user should see "Aplace to share you knowledge"
    And the user should be on "Your Feed" tab

  Scenario: user has one articles and delete it
    When the user navigate to "title 2" article
    Then the user should see "Delete Article" button
    When the user clicks on "Delete Article" button
    Then the user should see "Aplace to share you knowledge"
    And the user should be on "Your Feed" tab
    Then the user should not see "title 2" article
    And the user should see "No articles are here... yet"
    When the user clicks on "Favorited Articles" tab
    Then the user should not see "title 2" article
    And the user should see "No articles are here... yet"



