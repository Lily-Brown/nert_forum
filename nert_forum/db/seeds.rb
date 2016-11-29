# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'Admin', neighborhood: 'Neighborhood', email: 'admin@admin.com', password: 'password', admin: true },
  { name: 'Lily Cole', neighborhood: 'Crocker Amazon', email: 'lily@lily.com', password: 'password'},
  { name: 'Chris Chan', neighborhood: 'East Bay', email: 'chris@chris.com', password: 'password'},
  { name: 'Toby Zitsman', neighborhood: 'Palo Alto', email: 'toby@toby.com', password: 'password'},
  { name: 'Natalia Hess', neighborhood: 'Berkeley Hills', email: 'natalia@natalia.com', password: 'password'},
  { name: 'Kenny Bushman', neighborhood: 'Fairfax', email: 'kenny@kenny.com', password: 'password'},
  { name: 'Teddy Coleman', neighborhood: 'Portrero', email: 'teddy@teddy.com', password: 'password'},
  { name: 'Lynette Durán', neighborhood: 'TL', email: 'lynette@lynette.com', password: 'password'},
  { name: 'Sheri Aminshahidy', neighborhood: 'SF', email: 'sheri@sheri.com', password: 'password'},
  { name: 'Ryan Hamill', neighborhood: 'East Bay', email: 'ryan@ryan.com', password: 'password'},
  { name: 'Bill Cheng', neighborhood: 'East Bay', email: 'bill@bill.com', password: 'password'},
  { name: 'Brandon Kerr', neighborhood: 'TL', email: 'brandon@brandon.com', password: 'password'},
  { name: 'Alivia', neighborhood: 'Oakland', email: 'alivia@alivia.com', password: 'password'}
]);
  
Post.create([
  { title: 'Welcome to the NERT Forum', user_id: User.first.id, 
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { title: 'History Hike', user_id: User.first.id, 
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { title: 'Volunteer Opportunities?', user_id: User.second.id, 
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { title: 'Park Improvements', user_id: User.third.id, 
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { title: 'Anyone interested in Neighborhood Hike?', user_id: User.fourth.id, 
    text_body: 'Ut at odio metus. Fusce at mollis nisl, a pharetra mi. In hac habitasse platea dictumst. Aenean nec dignissim justo. Quisque maximus cursus elit. Pellentesque nisl nunc, blandit eu odio et, laoreet porta erat. Nunc molestie sagittis purus.' },
  { title: 'New Mural on Fourth and Mission', user_id: User.fifth.id, 
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { title: 'Thank You to the SFFD', user_id: User.last.id, 
  text_body: 'Ut at odio metus. Fusce at mollis nisl, a pharetra mi. In hac habitasse platea dictumst. Aenean nec dignissim justo. Quisque maximus cursus elit. Pellentesque nisl nunc, blandit eu odio et, laoreet porta erat. Nunc molestie sagittis purus.' },
  { title: 'Help Cleaning up Gough Street', user_id: User.second.id, 
  text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { title: 'Neighborhood Watch', user_id: User.third.id, 
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' }
]);

Comment.create([
  { user_id: users.first.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.second.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.third.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.fourth.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.fifth.id, parent_id: Post.last.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.first.id, parent_id: Post.last.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.second.id, parent_id: Post.second.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.third.id, parent_id: Post.second.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.fourth.id, parent_id: Post.second.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.fifth.id, parent_id: Post.second.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.last.id, parent_id: Post.third.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.last.id, parent_id: Post.third.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' }
]);

Event.create([
  { name: 'CPR Recertification', user_id: User.first.id,
    location: '225 Bush Street, San Francisco, CA, United States', event_date: 'Wed, 30 Nov 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:00:00 UTC +00:00',
    description: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { name: 'Neighborhood Potluck', user_id: User.first.id,
    location: '435 McAllister Street, San Francisco, CA, United States', event_date: 'Thu, 01 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:09:00 UTC +00:00',
    description: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { name: 'Refresher Course', user_id: User.first.id,
    location: 'Sf General Hospital, San Francisco, CA, United States', event_date: 'Fri, 02 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:06:54 UTC +00:00',
    description: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { name: 'Neighborhood Watch', user_id: User.first.id,
    location: 'Corona Heights, San Francisco, CA, United States', event_date: 'Sat, 03 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:00:00 UTC +00:00',
    description: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { name: 'Volunteer Opportunities', user_id: User.first.id,
    location: 'Potrero Ave & 25th St, San Francisco, CA, United States', event_date: 'Sun, 04 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:12:00 UTC +00:00',
    description: 'Ut at odio metus. Fusce at mollis nisl, a pharetra mi. In hac habitasse platea dictumst. Aenean nec dignissim justo. Quisque maximus cursus elit. Pellentesque nisl nunc, blandit eu odio et, laoreet porta erat. Nunc molestie sagittis purus.' },
  { name: 'Help out at the Soup Kitchen', user_id: User.first.id,
    location: 'Powell St. Station, Market Street, San Francisco, CA, United States', event_date: 'Mon, 05 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:02:30 UTC +00:00',
    description: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { name: 'Meet Up and BBQ', user_id: User.first.id,
    location: '3101 24th Street, San Francisco, CA, United States', event_date: 'Tue, 06 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:01:30 UTC +00:00',
    description: 'Ut at odio metus. Fusce at mollis nisl, a pharetra mi. In hac habitasse platea dictumst. Aenean nec dignissim justo. Quisque maximus cursus elit. Pellentesque nisl nunc, blandit eu odio et, laoreet porta erat. Nunc molestie sagittis purus.' },
  { name: 'Clean Up Portrero!', user_id: User.first.id,
    location: 'Gough Street, San Francisco, CA, United States', event_date: 'Wed, 07 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:09:00 UTC +00:00',
    description: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { name: 'Art Walk', user_id: User.first.id,
    location: '4791 18th Street, San Francisco, CA, United States', event_date: 'Thu, 08 Dec 2016 00:00:00 UTC +00:00', event_time: 'Wed, 30 Nov 2016 00:03:00 UTC +00:00',
    description: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' }
]);

EventsUser.create([
  { user_id: User.first.id, event_id: Event.first.id },
  { user_id: User.second.id, event_id: Event.first.id },
  { user_id: User.third.id, event_id: Event.first.id },
  { user_id: User.fourth.id, event_id: Event.first.id },
  { user_id: User.fifth.id, event_id: Event.first.id },
  { user_id: User.first.id, event_id: Event.first.id },
  { user_id: User.second.id, event_id: Event.first.id },
  { user_id: User.third.id, event_id: Event.second.id },
  { user_id: User.fourth.id, event_id: Event.second.id },
  { user_id: User.last.id, event_id: Event.second.id },
  { user_id: User.first.id, event_id: Event.second.id },
  { user_id: User.second.id, event_id: Event.second.id },
  { user_id: User.third.id, event_id: Event.second.id },
  { user_id: User.last.id, event_id: Event.second.id },
  { user_id: User.fifth.id, event_id: Event.second.id }
]);

Comment.create([
  { user_id: users.first.id, parent_id: Event.first.id, parent_type: 'Event',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.second.id, parent_id: Event.first.id, parent_type: 'Event',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.third.id, parent_id: Event.first.id, parent_type: 'Event',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.fourth.id, parent_id: Event.first.id, parent_type: 'Event',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.fifth.id, parent_id: Event.last.id, parent_type: 'Event',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.first.id, parent_id: Event.last.id, parent_type: 'Event',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.second.id, parent_id: Event.second.id, parent_type: 'Event',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.third.id, parent_id: Event.second.id, parent_type: 'Event',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.fourth.id, parent_id: Event.second.id, parent_type: 'Event',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.fifth.id, parent_id: Event.second.id, parent_type: 'Event',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.last.id, parent_id: Event.third.id, parent_type: 'Event',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.last.id, parent_id: Event.third.id, parent_type: 'Event',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' }
]);