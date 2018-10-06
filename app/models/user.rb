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

class User < ApplicationRecord
  # for now there are only admins, but in the future the idea is to have
  # different roles with different access.
  ROLES = [:admin, :creator].freeze

  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :trackable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :validatable

  validates :role, inclusion: { in: ROLES.map(&:to_s) }

  def initialize(params = {})
    super(params)
    self.role = :admin if role.nil?
  end

  # creates role check methods
  # Example: def admin?, def creator?, ...
  ROLES.each do |role|
    define_method("#{role}?") { self.role == role.to_s }
  end

  def possible_roles
    ROLES
  end
end
