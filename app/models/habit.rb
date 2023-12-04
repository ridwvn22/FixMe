class Habit < ApplicationRecord

    enum status: {
    new_habit: 'new_habit',
    current: 'current',
    not_done: 'not_done'
  }

    belongs_to :users, class_name: 'User', foreign_key: 'users_id'
end
