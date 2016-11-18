class Post < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user
  
end
