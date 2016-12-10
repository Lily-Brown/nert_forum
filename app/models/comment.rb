class Comment < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  before_save :default_values
  def default_values
    self.flagged ||= false
  end

  belongs_to :parent, polymorphic: true
end
