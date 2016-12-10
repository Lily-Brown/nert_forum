class EventsUser < ApplicationRecord
  validates_uniqueness_of :user, :scope => :event

  belongs_to :user
  belongs_to :event
end
