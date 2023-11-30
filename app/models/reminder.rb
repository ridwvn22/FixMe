class Reminder < ApplicationRecord
    include Visible 

    belongs_to :habit
end
