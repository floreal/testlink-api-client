Feature: Getting projects list
  In order to know my test projects
  As a QA engineer
  I want to get a my project test suites list

Scenario: A project containing test suites
  Given a fresh database "some_testsuites"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name          | value              |
    | testprojectid | 1                  |
   And I call "getFirstLevelTestSuitesForTestProject"
  Then I get this node list:
    | id | parent_id | type_id |order | table      | name             |
    | 2  | 1         | 2       | 1    | testsuites | First Testsuite  |
    | 3  | 1         | 2       | 2    | testsuites | Second testsuite |

Scenario: A project containing no test suite
  Given a fresh database "one_project"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name          | value              |
    | testprojectid | 1                  |
   And I call "getFirstLevelTestSuitesForTestProject"
  Then A response error exception is raised with a message "(getFirstLevelTestSuitesForTestProject) - Test Project (Sample Project) is empty."