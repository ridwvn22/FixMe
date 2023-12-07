class HomeController < ApplicationController
    def index
        @habits = Habit.all
        @reminders = Reminder.includes(:habit).all
      end
    end
    