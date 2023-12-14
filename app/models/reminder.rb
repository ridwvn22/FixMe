class Reminder < ApplicationRecord
    belongs_to :habit
    belongs_to :user
  
  
    enum frequency: {
      morning: 'Morning',
      afternoon: 'Afternoon',
      evening: 'Evening'
    }
    has_one :calendar, as: :eventable
  end
  