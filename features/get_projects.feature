Feature: Getting projects list
  In order to know my test projects
  As a QA engineer
  I want to get a my projects list

Scenario: Remote API returns projects list
  Given a TestLink Api link for "http://qa.example.com" with devKey ""
    And a remote api containing those projects:
    | id |  name  | prefix | notes                    |
    | 1  | First  | FST    | <p>One first project</p> |
    | 2  | Second | SCD    | <p>A second project</p>  |
  When remote call for getProjects returns remote data previously set
   And I call "getProjects"
  Then I get this Project list:
    | id |  name  | prefix | notes                    |
    | 1  | First  | FST    | <p>One first project</p> |
    | 2  | Second | SCD    | <p>A second project</p>  |

Scenario: Remote API raises an Error
  Given a TestLink Api link for "http://qa.example.com" with devKey ""
  When remote call returns an error 2000: "Can not authenticate client: invalid developer key"
   And I call "getProjects"
  Then A response error exception is raised with a message "Can not authenticate client: invalid developer key"
  
Scenario: Getting project list from a real TestLink instance
  Given a fresh database "one_project"
    And a TestLink Api link for "http://qa.localhost" with devKey "720aba7a9dad75eeb87ce253c08f6be5"
  When I call "getProjects"
  Then I get this Project list:
    | id | name           | prefix | notes                              |
    | 1  | Sample Project | SP     | <p>Project for test automation</p> |

Scenario: Attempting to get project list from a real TestLink instance with a bas key
  Given a TestLink Api link for "http://qa.localhost" with devKey "__bad_key__"
  When I call "getProjects"
  Then A response error exception is raised with a message "Can not authenticate client: invalid developer key"

Scenario: Developer key is overridden
  Given a fresh database "one_project"
    And a TestLink Api link for "http://qa.localhost" with devKey "__bad_key__"
  When I use these parameters:
    | name   | value                            |
    | devKey | 720aba7a9dad75eeb87ce253c08f6be5 |
   And I call "getProjects"
  Then I get this Project list:
    | id | name           | prefix | notes                              |
    | 1  | Sample Project | SP     | <p>Project for test automation</p> |