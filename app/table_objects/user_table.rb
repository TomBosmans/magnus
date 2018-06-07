class UserTable < ApplicationTable
  column :email,
         label: User.human_attribute_name(:email)

  column :role,
         label: User.human_attribute_name(:role)

  column :last_sign_in_ip,
         label: User.human_attribute_name(:last_sign_in_ip)

  resource_action :destroy,
                  icon: 'delete',
                  css_class: 'red-text',
                  path: ->(user) { [:admin, user] },
                  method: 'DELETE'

  table_action :new_user,
               icon: 'add',
               path: [:new, :admin, :user]
end
