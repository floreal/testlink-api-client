Feature: Getting testsuites top testsuites list
  In order to know my test projects
  As a QA engineer
  I want to get a test suite children test suites list

Scenario: A test suite containing another one
  Given a fresh database "some_testsuites"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name        | value              |
    | testsuiteid | 2                  |
   And I call "getTestSuitesForTestSuite"
  Then I get this node list:
    | id | parent_id | type_id |order | name                    | details                  |
    | 4  | 2         | 2       | 1    | First Testsuite's child | <p>First one's child</p> |

Scenario: A test suite containing no other
  Given a fresh database "some_testsuites"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name        | value              |
    | testsuiteid | 3                  |
   And I call "getTestSuitesForTestSuite"
  Then A response error exception is raised with a message "Response is empty"

Scenario: A test suite that dosen't exist
  Given a fresh database "one_project"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name        | value              |
    | testsuiteid | 2                  |
   And I call "getTestSuitesForTestSuite"
  Then A response error exception is raised with a message "(getTestSuitesForTestSuite) - ID 2 do not belongs to a Test Suite present on system!"