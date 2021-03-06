# frozen_string_literal: true

require_relative 'utils/utils'
require_relative 'jiraquest/quests/quests'

Login.new.login

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome

Quests.new.launch_quest
