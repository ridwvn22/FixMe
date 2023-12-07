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
    validates :date, presence: true

    def to_event
        {
          id: id,
          title: name,
          start: start_date,
          allDay: true,
          color: status_color,
          url: Rails.application.routes.url_helpers.habit_path(self), 
        }
      end

      private

  def status_color
  end
end

    
    
