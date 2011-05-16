Feature: Getting a single testsuite by it's Id
  In order to know my test projects
  As a QA engineer
  I want to get a specific test suite and I know it's ID

Scenario: A test suite containing another one
  Given a fresh database "some_testsuites"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name        | value              |
    | testsuiteid | 2                  |
   And I call "getTestSuiteByID"
  Then I get this node list:
    | id | parent_id | type_id | name            | order | details                   |
    | 2  | 1         | 2       | First Testsuite | 1     | <p>My first testsuite</p> |

Scenario: A test suite that dosen't exist
  Given a fresh database "one_project"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name        | value              |
    | testsuiteid | 2                  |
   And I call "getTestSuiteByID"
  Then A response error exception is raised with a message "(getTestSuiteByID) - ID 2 do not belongs to a Test Suite present on system!"