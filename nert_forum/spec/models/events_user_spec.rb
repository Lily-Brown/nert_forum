require 'rails_helper'

RSpec.describe EventsUser, type: :model do
  describe "::user" do
    it "can belong to a user" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      attendee = EventsUser.create(user_id:user.id,event_id:event.id)
      expect(attendee.user).to eq(user)
    end
  end

    describe "::event" do
    it "can belong to a event" do
      user = User.create(email:"test@test.com",password:"password")
      event = user.events.create(name:"Event Name",description:"This is the description for the Event.",location:"Event Location.")
      attendee = EventsUser.create(user_id:user.id,event_id:event.id)
      expect(attendee.event).to eq(event)
    end
  end
end
