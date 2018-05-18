# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Shown on the sidenav

Setting.create(
  name: 'Magnus',
  description: 'Back end for your front end'
)

content = Group.create(
  name: 'content'
)

Page.create(
  name: 'about me',
  text: 'some info about yourself',
  group: content
)

reviews = Group.create(
  name: 'Reviews',
  description: 'all my reviews about stuff',
  group: content
)
