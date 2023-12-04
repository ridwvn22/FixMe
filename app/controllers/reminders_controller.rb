class RemindersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  
    def index
        @habit = Habit.find(params[:habit_id])
        @reminders = @habit.reminders
    end
  
    def show
      @reminder = Reminder.find(params[:id])
    end
  
    def new
      @reminder = Reminder.new
    end
  
    def create
      @reminder = Reminder.new(reminder_params)
  
      if @reminder.save
        redirect_to @reminder, notice: 'Reminder was created.'
      else
        render :new
      end
    end
  
    def edit
      @reminder = Reminder.find(params[:id])
    end
  
    def update
      @reminder = Reminder.find(params[:id])
  
      if @reminder.update(reminder_params)
        redirect_to @reminder, notice: 'Reminder was updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @reminder = Reminder.find(params[:id])
      @reminder.destroy
  
      redirect_to habit_reminder_path, notice: 'Reminder was destroyed.'
    end
  
    private
  
    def reminder_params
      params.require(:reminder).permit(:frequency, :habit_id)
    end
  end
  