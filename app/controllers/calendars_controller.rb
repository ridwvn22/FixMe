class CalendarsController < ApplicationController
    def index
        render plain: 'Hello, Calendars!'
        @habits = Habit.all
    end

    def new
      @habit = Habit.find(params[:id])
    end
    
    def create
      @habit = Habit.new(habit_params)
      puts params.inspect
      @habit.create_calendar(title: 'Habit Event', start_time: @habit.date, end_time: @habit.date + 1.hour)
      if @habit.save
        redirect_to @habit
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def create_reminder
      @reminder = Reminder.create(reminder_params)
      @reminder.create_calendar(title: 'Reminder Event', start_time: @reminder.created_at, end_time: @reminder.created_at + 1.hour)
    end

    def calenders
    end

  
    private
  
    def habit_params
        params.require(:habit).permit(:name, :description, :duration, :user_id, :status)
    end
  
    def reminder_params
        params.require(:reminder).permit(:frequency, :habit_id, :description, :date, :calendar_id)
    end
  end
  