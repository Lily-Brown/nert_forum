# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'Lily', email: 'lily@lily.com', password: 'password', admin: true },
  { name: 'Goober T Cat', email: 'goobs@goobs.com', password: 'password'},
  { name: 'Chris', email: 'chris@chris.com', password: 'password'},
  { name: 'Toby', email: 'toby@toby.com', password: 'password'}
]);
  
Post.create([
  { title: 'First Post', user_id: users.first.id, 
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { title: 'Second Post', user_id: users.first.id, 
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { title: 'Third Post', user_id: users.first.id, 
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { title: 'First Post', user_id: users.last.id, 
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { title: 'Second Post', user_id: users.last.id, 
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { title: 'Third Post', user_id: users.last.id, 
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' }
]);

Comment.create([
  { user_id: users.first.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.first.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.first.id, parent_id: Post.first.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' },
  { user_id: users.last.id, parent_id: Post.second.id, parent_type: 'Post',
    text_body: 'Nam magna elit, vehicula nec tristique id, luctus non urna. Morbi quis est at eros pellentesque finibus. Donec quis purus sit amet lectus interdum finibus. Nunc a semper nulla. Integer euismod velit risus, elementum porttitor diam tincidunt ac. Cras tempor risus vitae nunc elementum, vel congue mauris venenatis.' },
  { user_id: users.last.id, parent_id: Post.last.id, parent_type: 'Post',
    text_body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc purus erat, sodales id sodales ut, interdum nec nibh. Nam magna elit, vehicula nec tristique id, luctus non urna.' },
  { user_id: users.last.id, parent_id: Post.last.id, parent_type: 'Post',
    text_body: 'Pellentesque urna felis, interdum in maximus sit amet, tristique eu neque. Sed feugiat posuere sapien, eu venenatis enim sollicitudin non. Pellentesque turpis ligula, tincidunt id lacus nec, dapibus suscipit odio. Nulla ut vehicula mi. Maecenas accumsan quam ac odio dapibus tincidunt.' }
]);