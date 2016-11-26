class Post < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user
  
  has_many :comments, as: :parent
end
