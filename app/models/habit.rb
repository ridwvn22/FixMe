class Habit < ApplicationRecord

    belongs_to :user

    enum status: {
        new_habit: 'new_habit',
        current: 'current',
        not_done: 'not_done'
    }

    has_many :reminders
    
end