class LogsController < ApplicationController
    before_action :set_habit, only: [:new, :create, :index, :destroy]

    def index
        @logs = @habit.logs
      end
    
    def new
      @log = Log.new
    end
  
    def create
      @log = @habit.logs.new(log_params.merge(user: current_user))
  
      if @log.save
        redirect_to @habit, notice: 'Log entry was created.'
      else
        render :new
      end
    end

    def edit
        @log = Log.find(params[:id])
    end
    
    def update
        @log = Log.find(params[:id])
    
        if @log.update(log_params)
          redirect_to habit_logs_path(@habit), notice: 'Log entry was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        @log = @habit.logs.find(params[:id])
        @log.destroy
        redirect_to habit_logs_path(@habit), notice: 'Log entry was successfully destroyed.'
    end
  
    private
  
    def set_habit
      @habit = Habit.find(params[:habit_id])
    end
  
    def log_params
      params.require(:log).permit(:entry_date, :notes)
    end
  end
  

