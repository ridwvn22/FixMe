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
        @habit = Habit.find(params[:habit_id])
        @reminder = @habit.reminders.new(reminder_params)
      
      if @reminder.save
        redirect_to habit_reminder_path(@habit, @reminder), notice: 'Reminder was created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @reminder.update(reminder_params)
        redirect_to @reminder, notice: 'Reminder was updated.'
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
    end

    def reminder_params
      params.require(:reminder).permit(:frequency, :habit_id)
    end
  end
  