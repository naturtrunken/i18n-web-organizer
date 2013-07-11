Feature: Translations

  As a user,
  I want to edit my translation files of a project,
  to organize my translations of this project.

  Background:
    Given that the following projects exist:
      | Name      | Directory      | Default language | Target language 1 | Target language 2 |
      | Project 1 | /tmp/project1/ | English          | German            | Spanish           |
    And there are the following directories in "/tmp/project1/":
      | Name  |
      | dir_a |
      | dir_b |
      | dir_c |


  @javascript
  Scenario: Changing of the translation directory in a project.
    When the user visits the translation view for the project in the directory "/tmp/project1/",
    And he choose the directory "dir_b",
    Then he sees the translation page for the directory "dir_b".

