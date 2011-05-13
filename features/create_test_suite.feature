Feature: Creating test suite
  In order to organize my testcases
  As a QA engeineer
  I want to create testsuites for my projects
  
Scenario: Creating a simple Testsuite on a real TestLink instance
  Given a fresh database
   And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name          | value              |
    | testprojectid | 1                  |
    | testsuitename | My test suite      |
    | details       | <p>Lorem Ipsum</p> |
   And I call "createTestSuite"
  Then I get status "true" for "createTestSuite" with additionalInfo "" and message "ok"

Scenario: Creating a Testsuite twice on a real TestLink instance
  Given a fresh database
   And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name          | value              |
    | testprojectid | 1                  |
    | testsuitename | My test suite      |
    | details       | <p>Lorem Ipsum</p> |
   And I call "createTestSuite"
   And I call "createTestSuite"
  Then A response error exception is raised with a message "Command has failed: There's already a Test Suite with name: My test suite"
  
Scenario: Explicitly block when creating twice the same testsuite twice
Given a fresh database
   And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name                   | value              |
    | testprojectid          | 1                  |
    | testsuitename          | My test suite      |
    | details                | <p>Lorem Ipsum</p> |
    | checkduplicatedname    | true               |
    | actiononduplicatedname | block              |
   And I call "createTestSuite"
   And I call "createTestSuite"
  Then A response error exception is raised with a message "Command has failed: There's already a Test Suite with name: My test suite"
  
Scenario: create new when creating twice the same testsuite twice
Given a fresh database
   And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I use these parameters:
    | name                   | value              |
    | testprojectid          | 1                  |
    | testsuitename          | My test suite      |
    | details                | <p>Lorem Ipsum</p> |
    | checkduplicatedname    | true               |
    | actiononduplicatedname | create_new         |
   And I call "createTestSuite"
   And I call "createTestSuite"
  Then I get status "true" for "createTestSuite" with additionalInfo "" and message "ok"
  