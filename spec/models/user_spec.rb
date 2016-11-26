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

  describe "::email" do
    it "has an email attribute" do
      user.email = "email@email.com"
      expect(user.email).to eq("email@email.com")
    end
  end

  describe "::neighborhood" do
    it "has an neighborhood attribute" do
      user.neighborhood = "Neighborhood"
      expect(user.neighborhood).to eq("Neighborhood")
    end
  end

  describe "::comments" do
    it "can have many comments" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      comment1 = event.comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      comment = event.comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      expect(user.comments).to eq([comment1,comment])
    end
  end

  describe "::posts" do
    it "can have many posts" do
      user = User.create(email:"test@test.com",password:"password")
      post = user.posts.create(title:"Post Name",text_body:"This is the text for the Post.")
      post1 = user.posts.create(title:"Post Name",text_body:"This is the text for the Post.")
      expect(user.posts).to eq([post,post1])
    end
  end

  describe "::events" do
    it "can have many events" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      event1 = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      expect(user.events).to eq([event,event1])
    end
  end

  describe "::attended_events" do
    it "can have many attended_events" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      event1 = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      event.attendees << user
      event1.attendees << user
      expect(user.attended_events).to eq([event,event1])
    end
  end

end