class HabitsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_category, only: [:show, :edit, :update, :destroy]
        
    def index
    @habits = Habit.all
    end

    def show
    end

    def edit
    end

    def new
    @habit = Habit.new
    end

    def create
        @habit = Habit.new(habit_params)
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
    params.require(:habit).permit(:name, :description, :duration, :user_id)
end
end
