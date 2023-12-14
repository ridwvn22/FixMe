class RemindersController < ApplicationController
    before_action :set_habit
    before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  
    def index
      @reminders = @habit.reminders
    end
  
    def show
    end
  
    def new
      @reminder = Reminder.new
    end
  
    def create
        # @reminder = @habit.reminders.new(reminder_params)
        @habit = Habit.find(params[:habit_id])
        @reminder = @habit.reminders.build(reminder_params)
        @reminder.user = current_user
      
        if @reminder.save
          redirect_to habit_reminder_path(@habit, @reminder), notice: 'Reminder was created.'
        else
            puts @reminder.errors.full_messages
          render :new
        end
      end
  
    def edit
    end
  
    def update
      if @reminder.update(reminder_params)
        redirect_to habit_reminders_path(@reminder.habit), notice: 'Reminder was updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @reminder.destroy
      redirect_to habit_reminders_path(@habit), notice: 'Reminder was deleted.'
    end
  
    private
  
    def set_habit
      @habit = Habit.find(params[:habit_id])
    end
  
    def set_reminder
      @reminder = Reminder.find(params[:id])
      @reminder = @habit.reminders.find(params[:id])
    end
  
    def reminder_params
      params.require(:reminder).permit(:user_id, :frequency, :habit_id, :calendar_date, :description)
    end
  end
  