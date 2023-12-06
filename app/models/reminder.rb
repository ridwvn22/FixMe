class Reminder < ApplicationRecord

    belongs_to :habit

    enum frequency: {
    morning: 'Morning',
    afternoon: 'Afternoon',
    evening: 'Evening'
  }
  
end
