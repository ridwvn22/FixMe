require 'httparty'

class HabitsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_habit, only: [:show, :edit, :update, :destroy]
  
    def index
        @habits = current_user.habits
        @reminders = current_user.habits.joins(:reminders)

        @new_habits = Habit.where(status: :new_habit)
        @current_habits = Habit.where(status: :current)
        
        @habits = Habit.all_habits
        @events = @habits.map { |habit| { title: habit.name, start: habit.duration } }

        puts '...............................'
        puts "Events: #{@events.inspect}"

      respond_to do |format|
        format.html
        format.json { render json: @events }
      end
    end
  
   def show
    @habit = Habit.find(params[:id])
    @log = Log.new 
    @reminder = Reminder.new
    @habit_events = @habit.events
    @date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today

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
          redirect_to habit_path(@habit)

        else
          render :new, status: :unprocessable_entity
        end
      end



    # def create
    #     @habit = current_user.habits.build(habit_params)
      
    #     if @habit.save
    #       # You can access the values like this:
    #       calendar_type = params[:habit][:calendar_type]
    #       calendar_date = params[:habit][:calendar_date]
      
    #       # Now, you can use these values as needed.
          
    #       redirect_to @habit, notice: 'Habit was created.'
    #     else
    #       render :new
    #     end
    #   end
      
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
        @habit.update(status: :current)
        redirect_to habits_path, notice: 'Habit marked as current.'
      end
  
    def calendars
        @habit = Habit.find(params[:id])
        @events = @habit.events
        @all_habits = current_user.habits
        @all_reminders = current_user.reminders
    end
end

    private
  
    def habit_events
      (current_user.habits + current_user.habits.joins(:reminders)).map(&:to_event)
    end
  
    def set_habit
      @habit = Habit.find(params[:id])
    end
  
    def habit_params
        params.require(:habit).permit(:name, :description, :duration, :status)
    end
  
  