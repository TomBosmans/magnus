class User < ApplicationRecord
  # for now there are only admins, but in the future the idea is to have
  # different roles with different access.
  ROLES = [:admin, :creator].freeze

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
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
