# NERT Forum

## Final Project

### Synopsis

The NERT Forum is a place to encourage involvement, engagement and community among graduates of the [NERT Program](http://sf-fire.org/neighborhood-emergency-response-team-nert). Users can contribute to the community conversation by creating Posts and Commenting on these Posts. They can also create Events -- from small gatherings like Potlucks and Meet-ups for Coffee to big events list Volunteer Opportunities, Skill Building Workshops and Block Parties. Users can Join these events and post Comments to contribute to and start discussion around these meet-ups.

### Deployment

See this project live [https://nert-forum.herokuapp.com/](https://nert-forum.herokuapp.com/)

### Technologies

- Ruby on Rails
- Javascript
- JQuery
- [Rspec](https://github.com/rspec/rspec-rails)
- [Devise](https://github.com/plataformatec/devise) for Auth
- [Materialize](http://materializecss.com)
- [Paperclip](https://github.com/thoughtbot/paperclip)
- [GeoComplete](https://ubilabs.github.io/geocomplete)
- [Clockpicker](https://github.com/chingyawhao/materialize-clockpicker)

### Installation

1 - Fork and clone this repository.

2 - CD into the project directory:v```> cd nert_forum```

3 - CD into Rails app directory: ```> cd nert_forum```
(Yes, do this twice.)

4 - Install gems: ```> bundle install```

5 - Create the database: ```> rake db:create```

6 - Migrate the database: ```> rake db:migrate```

7 - Run the server: ```> rails s```

8 - Visit: http://localhost:3000/ to see your app live.

### Screenshots

Home Page - Upcoming Events and Recent Posts
![Home Page](http://i.imgur.com/00mUu2P.jpg)

Profile Page - Events Attending, Posts and Comments
![Profile Page](http://i.imgur.com/2l527F6.png)

Event Page - Details, Users Attending, Join Event
![Event Page](http://i.imgur.com/bVhvClL.jpg)

Dashboard Page - User Management, Post/Comment Moderation
![Dashboard Page](http://i.imgur.com/lrDnCq3.png)

### Challenges

1) One of my first iterations of this project was using Ember.js as the front end. 

You can see my progress here: [github/nert-forum](https://github.com/LilyCole/nert-forum). It was great learning a new framework but, when taking time management/project scope into account, I ended up starting from scratch with Ruby on Rails. My biggest struggles in Ember were basically relearning how to do the simplest of actions. My hope is to pick up from where I left off and employ Ember in a future project.

2) In my Ember project: Authentication. 

I had originally started implementing Devise on the backend with Rails but it became clear this would not be helpful or useful integrating with Ember. Instead, I had to build my own auth with a Sessions Controller, SecureRandom.uuid, and by building a and using a service in Ember.

Backend: app/controllers/sessions_controller.rb
```ruby
class SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      user.auth_key = SecureRandom.uuid
      user.save
      session = Session.new(auth_key: user.auth_key, user: user, id: user.id)
      render :json => session, status: :created
    else
      render status: :unauthorized
    end
  end
  # ...
end
```

Frontend: app/controllers/login.js
```javascript 
import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    login() { 
      this.get('model').save().then(
        () => {
          var currentService = this.get('current');
          var user = this.get('model.user');
          var authKey = this.get('model.authKey');
          currentService.set('user',user);
          currentService.set('token',authKey);
          this.transitionToRoute('user',user);
        }, 
        function() { 
          alert('Invalid email or password.'); 
        }
      );
    }
  }
});
```

Frontend: app/adapters/application.js
```javascript
import Ember from 'ember';
import JSONAPIAdapter from 'ember-data/adapters/json-api';


const { String: { pluralize, underscore } } = Ember;

export default JSONAPIAdapter.extend({
  current: Ember.inject.service(),
  headers: function() {
    var token = this.get('current.token');
    return {
      "Authorization":'Token token=' + token
    };
  }.property().volatile(),

  pathForType(type) {
    return pluralize(underscore(type));
  }

});
```

Sets Auth Key Token in Headers!
![AuthKey](http://i.imgur.com/RXlceHz.png)

3) In my Rails project: Deploying to Heroku

Yikes, did I run into many issues here. 

My first struggle was with a nested application path (see: [StackOverflow](http://stackoverflow.com/questions/40835985/rails-deployment-on-heroku-failed-to-detect-set-buildpack)). Most Google/SO results yielded the same solutions and none worked for me. It turns out Heroku expects your git respository to be the base level of your application. To get around this, I had to run: ```git subtree push --prefix nert_forum heroku master``` to specify the root of my application.

I also had issues with precompilation of assets, which was fixed by remembering to run: ```RAILS_ENV=production bundle exec rake assets:precompile``` before each push.

Lastly, default images for paperclip. (As well as the expected image deprecation.) My future goal is to implement Paperclip using S3 to persist the data on Heroku.

### Future Features
- Persistent Images with S3/Paperclip
- Calendar View for Events Index
- Storing Reasons for Flagging a Post/Comment

### Process

See: [Planning_Deliverables](https://github.com/LilyCole/nert_forum/blob/master/Planning%20Deliverables.md) for Wireframes, User Stories, Sprints
