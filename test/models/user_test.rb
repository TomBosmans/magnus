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

describe User do
  instance_responds_to :role, :email, :password, :possible_roles,
                       :admin?, :creator?

  describe '#role' do
    it 'is by default admin' do
      assert_equal User.new.role, 'admin'
    end

    it 'role has to be in possible_roles' do
      user = create(:user)
      user.role = 'this is not in possible roles'
      assert_not user.valid?
    end
  end
end
