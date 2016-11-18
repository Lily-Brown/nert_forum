require 'rails_helper'

RSpec.describe Comment, type: :comment do
  subject(:user) {User.new}
  subject(:post) {Post.new}
  subject(:comment) {Comment.new}

  describe "::new" do
    it "initializes a new comment" do
      expect(comment).to be_a(Comment)
    end
  end

  describe "::text_body" do
    it "has an text_body attribute" do
      user = User.create(email:"test@test.com",password:"password")
      post = user.posts.create(title:"Post Title",text_body:"Post body")
      comment = user.posts[0].comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      expect(comment.text_body).to eq("This is the body of my comment.")
    end
  end

  describe "::owner" do
    it "can belong to a user" do
      user = User.create(email:"test@test.com",password:"password")
      post = user.posts.create(title:"Post Title",text_body:"Post body")
      comment = user.posts[0].comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      expect(comment.owner).to eq(user)
    end
  end

end