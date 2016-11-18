require 'rails_helper'

RSpec.describe User, type: :user do
  subject(:user) {User.new}

  describe "::new" do
    it "initializes a new user" do
      expect(user).to be_a(User)
    end
  end

  describe "::name" do
    it "has an name attribute" do
      user.name = "Name"
      expect(user.name).to eq("Name")
    end
  end

  # describe "::text_body" do
  #   it "has an text_body attribute" do
  #     user.text_body = "This is the body of my user."
  #     expect(user.text_body).to eq("This is the body of my user.")
  #   end
  # end

  # describe "::owner" do
  #   it "can belong to a user" do
  #     expect(user.owner).to eq(user)
  #   end
  # end

end