class Post < ApplicationRecord
  belongs_to :user
  alias_method :owner, :user

  validates :title, :text_body, presence: true
  
  before_save :default_values
  def default_values
    self.flagged ||= false
  end

  has_many :comments, as: :parent, :dependent => :destroy
end
