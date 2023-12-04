class HomeController < ApplicationController
     def index
        @reminders = Reminder.all
    end
end