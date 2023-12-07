class Reminder < ApplicationRecord
    belongs_to :habit
  
    enum frequency: {
      morning: 'Morning',
      afternoon: 'Afternoon',
      evening: 'Evening'
    }
  
    has_one :calendar, as: :eventable
  
    validates :description, presence: true
  
    def to_event
      {
        id: id,
        title: habit.name, 
        start: reminder_time,
        allDay: false,
        color: 'red', 
        url: Rails.application.routes.url_helpers.habit_path(habit), 
      }
    end
  
    def description
      self[:description]
    end
  end
  