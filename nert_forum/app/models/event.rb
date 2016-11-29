class Event < ApplicationRecord
  has_attached_file :photo, styles: { medium: '535x300#', thumb: '180x100#' }, default_url: '/app/assets/images/:style/event_default.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validate :event_date_cannot_be_in_the_past

  geocoded_by :location
  after_validation :geocode

  belongs_to :user
  alias_method :owner, :user

  validates :name, :location, :description, presence: true
  
  has_many :comments, as: :parent, :dependent => :destroy

  has_many :events_users, dependent: :destroy
  has_many :attendees, through: :events_users, source: :user, :dependent => :destroy

  def event_date_cannot_be_in_the_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, ' cannot be in the past.')
    end
  end
end
