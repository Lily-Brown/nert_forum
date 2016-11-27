class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo, styles: { medium: '300x300#', thumb: '100x100#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

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
