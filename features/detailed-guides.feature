Feature: Detailed guides

  Scenario: Creating a new draft detailed guide
    Given I am a writer in the organisation "Department of Examples"
    When I draft a new detailed guide "The finer points of moustache trimming"
    Then I should see the detailed guide "The finer points of moustache trimming" in the list of draft documents

  @javascript @design-system-wip
  Scenario: Adding multiple images
    Given I am a writer in the organisation "Department of Examples"
    Given I start drafting a new detailed guide
    When I select an image for the detailed guide
    Then I should be able to select another image for the detailed guide

  Scenario: Publishing a submitted detailed guide
    Given I am an editor in the organisation "Department of Examples"
    And a submitted detailed guide "Finer points of moustache trimming" exists
    When I publish the detailed guide "Finer points of moustache trimming"
    Then I should see the detailed guide "Finer points of moustache trimming" in the list of published documents

  Scenario: Viewing detailed guide publishing history
    Given I am an editor in the organisation "Department of Examples"
    Given a published detailed guide "Ban Beards" exists
    When I publish a new edition of the detailed guide "Ban Beards" with a change note "Exempted Santa Claus"
    And I publish a new edition of the detailed guide "Ban Beards" with a change note "Exempted Gimli son of Gloin"
