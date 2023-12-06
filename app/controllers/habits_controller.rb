require 'httparty'

class HabitsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_habit, only: [:show, :edit, :update, :destroy]
  
    def index
      @new_habits = Habit.where(status: :new_habit)
      @current_habits = Habit.where(status: :current)
      @habits = Habit.all
    end
  
   def show
     @habit = Habit.find(params[:id])

      chart_configuration = {
        type: 'bar',
        data: {
          labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
          datasets: [{
            label: @habit.name ,
            data: [4,5,6,7,8,9,4]
          }] 
        }
      }
  
      chart_json = chart_configuration.to_json
      url = 'https://quickchart.io/chart?c='
    #   HTTParty.post('http://example.com', body: "{\"foo\":\"bar\"}", headers: { 'Content-Type' => 'application/json' })
      response = HTTParty.post(url, body: chart_json, headers: { 'Content-Type' => 'application/json' })
  
    #   @chart_url = response['url'] if response.success?

      puts '.............'
      puts response

    #   @chart = response['url'] if response.success?
      @chart = "#{url}#{chart_json}"

      render 'show'

    end
  
    def edit
    end
  
    def new
      @habit = Habit.new
    end
  
    def create
      @habit = current_user.habits.build(habit_params)

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

    def mark_as_current
        @habit = Habit.find(params[:id])
    
        if @habit.update(status: :current)
          redirect_to habits_path, notice: 'This habit is now a current habit.'
        else
          redirect_to habits_path, alert: 'You have failed to update habit status.'
        end
      end
  
    private
  
    def set_habit
      @habit = Habit.find(params[:id])
    end
  
    def habit_params
      params.require(:habit).permit(:name, :description, :duration, :status)
    end
  end
  
  
  