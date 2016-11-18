require 'rails_helper'

RSpec.describe Post, type: :post do
  subject(:user) {User.new}
  subject(:post) {user.posts.new}

  describe "::new" do
    it "initializes a new post" do
      expect(post).to be_a(Post)
    end
  end

  describe "::title" do
    it "has an title attribute" do
      post.title = "Title"
      expect(post.title).to eq("Title")
    end
  end

  describe "::text_body" do
    it "has an text_body attribute" do
      post.text_body = "This is the body of my post."
      expect(post.text_body).to eq("This is the body of my post.")
    end
  end

  describe "::owner" do
    it "can belong to a user" do
      expect(post.owner).to eq(user)
    end
  end

end