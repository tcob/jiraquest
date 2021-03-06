# frozen_string_literal: true

require 'yaml/store'
require_relative '../../utils/utils'
require_relative '../distractions/distractions'

# Workspace setup miniquest
class Setup
  def initialize
    @store = DATA
    @user = @store.transaction { @store[:user] }
    @prompt = TTY::Prompt.new
  end

  def quest
    @prompt.warn("\nQuest 1")
    @prompt.ok("'Set up your Work Environment'")
    puts 'Can you avoid distractions and get your system ready to start collecting jiras?'
    @prompt.warn('Begin:')
    System.new.vpn if System.new.boot
    System.new.ide_update
    @prompt.warn('You updated your IDE, but lost work on 1 jira.')
    sleep 1
    Score.new.update_and_print(-1)
    sleep 1
    Reporter.new.quest_complete('Setup')
  end
end
