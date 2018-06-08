# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create(
  email: 'admin@magnus.com',
  password: 'magnusmagnus'
)

Setting.create(
  name: 'Magnus',
  description: 'Back end for your front end'
)

content = Group.create(
  name: 'content'
)
