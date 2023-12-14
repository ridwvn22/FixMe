class Habit < ApplicationRecord
    belongs_to :user
  
    enum status: {
      new_habit: 'new_habit',
      current: 'current',
      not_done: 'not_done'
    }
  
    has_many :reminders
    has_many :logs
  
    has_one :calendar, as: :eventable
  
    validates :name, presence: true

    def events
        [
          { title: name, start_time: duration },
        ]
    end
  
    def to_event
      {
        id: id,
        title: name,
        start: start_time,
        allDay: true,
        color: status_color,
        url: Rails.application.routes.url_helpers.habit_path(self),
      }
    end
  
    def start_time
      duration
    end
  
    def self.all_habits
      all
    end
  
    private
  
    def status_color
      case status
      when 'new_habit'
        'green'
      when 'current'
        'blue'
      when 'not_done'
        'red'
      else
        'black'
      end
    end
  end
  