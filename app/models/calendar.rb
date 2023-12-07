class Calendar < ApplicationRecord
    belongs_to :eventable, polymorphic: true
    
    validates :title, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true

end
