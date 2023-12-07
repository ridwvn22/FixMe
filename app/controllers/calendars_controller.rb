class CalendarsController < ApplicationController
    def index
        render plain: 'Hello, Calendars!'
    end
    
    def create_habit
      @habit = Habit.create(habit_params)
      @habit.create_calendar(title: 'Habit Event', start_time: @habit.date, end_time: @habit.date + 1.hour)
    end
  
    def create_reminder
      @reminder = Reminder.create(reminder_params)
      @reminder.create_calendar(title: 'Reminder Event', start_time: @reminder.created_at, end_time: @reminder.created_at + 1.hour)
    end
  
    private
  
    def habit_params
        params.require(:habit).permit(:name, :description, :duration, :user_id, :status)
    end
  
    def reminder_params
        params.require(:reminder).permit(:frequency, :habit_id)
    end
  end
  