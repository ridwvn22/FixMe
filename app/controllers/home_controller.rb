class HomeController < ApplicationController

    def index
        @habits = Habit.all
        @reminders = Reminder.includes(:habit).all
        @logs = Log.all
        @events = @habits.map(&:to_event)
      end
    end
    