class Comment < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  belongs_to :parent, polymorphic: true
end
