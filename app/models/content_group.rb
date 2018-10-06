# == Schema Information
#
# Table name: groups
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ContentGroup < Group
  default_scope { where_group_name('content') }

  def initialize(params = {})
    super(params)
    self.group = Group.find_or_create_by(name: 'content')
  end
end
