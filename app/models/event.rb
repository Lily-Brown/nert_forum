class Event < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user
  
  has_many :comments
end
