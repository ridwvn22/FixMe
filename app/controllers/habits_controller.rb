class HabitsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_habit, only: [:show, :edit, :update, :destroy]
  
    def index
      @new_habits = Habit.where(status: :new_habit)
      @current_habits = Habit.where(status: :current)
      @habits = Habit.all
    end
  
    def show
      chart_configuration = {
        type: 'bar',
        data: {
          labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
          datasets: [{
            label: 'Habit Progress',
            data: [10, 5, 15]
          }]
        }
      }
  
      response = HTTParty.get("https://quickchart.io/chart")
  
      @chart_url = response['url'] if response.success?
    end
  
    def edit
    end
  
    def new
      @habit = Habit.new
    end
  
    def create
      @habit = current_user.habits.new(habit_params)
      @habit.status = 'new_habit'
      if @habit.save
        redirect_to @habit, notice: 'Habit was created.'
      else
        render :new
      end
    end
  
    def update
      if @habit.update(habit_params)
        redirect_to @habit, notice: 'Habit was updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @habit.destroy
      redirect_to habits_path, notice: 'Habit was deleted.'
    end
  
    private
  
    def set_habit
      @habit = Habit.find(params[:id])
    end
  
    def habit_params
      params.require(:habit).permit(:name, :description, :duration, :status)
    end
  end
  
  
  