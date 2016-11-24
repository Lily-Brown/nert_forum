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
end
