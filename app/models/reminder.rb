class Reminder < ApplicationRecord
    belongs_to :habit
  
  
    enum frequency: {
      morning: 'Morning',
      afternoon: 'Afternoon',
      evening: 'Evening'
    }
    validates :name, presence: true
    has_one :calendar, as: :eventable
  end
  