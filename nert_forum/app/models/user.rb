class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true

  before_save :default_values
  def default_values
    self.admin ||= false
  end

  # Relationships
  has_many :posts
  has_many :comments
  has_many :events

  has_many :events_users, dependent: :destroy
  has_many :attended_events, through: :events_users, source: :event

end
