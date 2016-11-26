class Event < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  validates :name, :location, :description, presence: true
  
  has_many :comments, as: :parent

  has_many :events_users, dependent: :destroy
  has_many :attendees, through: :events_users, source: :user
end
