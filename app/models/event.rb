class Event < ApplicationRecord
  has_attached_file :photo, styles: { medium: '300x300#', thumb: '100x100#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  belongs_to :user
  alias_method :owner, :user

  validates :name, :location, :description, presence: true
  
  has_many :comments, as: :parent

  has_many :events_users, dependent: :destroy
  has_many :attendees, through: :events_users, source: :user
end
