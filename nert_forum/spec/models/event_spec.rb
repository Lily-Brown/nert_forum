require 'rails_helper'

RSpec.describe Event, type: :model do
  subject(:user) {User.new}
  subject(:event) {Event.new}

  describe "::new" do
    it "initializes a new event" do
      expect(event).to be_a(Event)
    end
  end

  describe "::name" do
    it "has an name attribute" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      expect(event.name).to eq("Event Name")
    end
  end

  describe "::location" do
    it "has an location attribute" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      expect(event.location).to eq("Event Location.")
    end
  end

  describe "::description" do
    it "has an description attribute" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      expect(event.description).to eq("This is the description for the Event.")
    end
  end

  describe "::owner" do
    it "can belong to a user as:owner" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      expect(event.owner).to eq(user)
    end
  end

  describe "::comments" do
    it "can have many comments" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      comment1 = event.comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      comment = event.comments.create(text_body:"This is the body of my comment.",user_id:user.id)
      expect(event.comments).to eq([comment,comment1])
    end
  end

  describe "::attendees" do
    it "can have many events_users as:attendees" do
      user = User.create(email:"test@test.com",password:"password")
      user2 = User.create(email:"test1@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      event.attendees << user
      event.attendees << user2
      expect(event.attendees).to eq([user,user2])
    end
  end

end
