Feature: Send notifications to Notification Center via Sticky Notifications.app
  So that I have a nice way of getting feedback from my script
  I want send notifications to Notification Center via Sticky Notifications.app

  Scenario: Basic UI
    When I get help for "post-it"
    Then the exit status should be 0
    And the banner should be present
    And the banner should include the version
    And the banner should document that this app takes options
    And the banner should document that this app's arguments are:
      |message| which is required |      
    And the following options should be documented:
      |--version|
      |--title|
      |--subtitle|
      |--prepare|
      