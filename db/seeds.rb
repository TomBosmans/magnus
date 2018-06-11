# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# In development use subdomain.lvh.me:3000
# more info: https://nickjanetakis.com/blog/ngrok-lvhme-nipio-a-trilogy-for-local-development-and-testing#lvh.me
tenant = Tenant.create(
  name: 'Magnus Example',
  description: 'Example tenant',
  subdomain: 'magnus-example'
)

Apartment::Tenant.switch!(tenant.subdomain)

User.create(
  email: 'admin@magnus.com',
  password: 'magnusmagnus'
)

content = Group.create(
  name: 'content'
)
