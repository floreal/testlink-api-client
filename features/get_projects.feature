Feature: Getting projects list
  In order to know my test projects
  As a QA engineer
  I want to get a my projects list

Scenario: Remote API returns projects list
  Given a TestLink Api link
    And a remote api containing those projects:
    | id |  name  | prefix | notes                    |
    | 1  | First  | FST    | <p>One first project</p> |
    | 2  | Second | SCD    | <p>A second project</p>  |
  When remote call returns a for getProjects returns remote data previously set
  Then I get this Project list:
    | id |  name  | prefix | notes                    |
    | 1  | First  | FST    | <p>One first project</p> |
    | 2  | Second | SCD    | <p>A second project</p>  |

Scenario: Remote API raises an Error
  Given a TestLink Api link
  When remote call returns an error 2000: "Can not authenticate client: invalid developer key"
  Then An response error exception ins raised