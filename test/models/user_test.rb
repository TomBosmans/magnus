# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  role                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test_respond_to User.new, [:role, :email, :password, :possible_roles]
  test_respond_to User.new, [:admin?, :creator?]

  test 'user is by default admin' do
    assert_equal User.new.role, 'admin'
  end

  test 'role has to be in possible_roles' do
    user = create(:user)
    user.role = 'this is not in possible roles'
    assert_not user.valid?
  end
end
