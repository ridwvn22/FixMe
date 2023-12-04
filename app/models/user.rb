class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable

  validates :first_name, :last_name, :username, presence: true

  has_many :habits
end
