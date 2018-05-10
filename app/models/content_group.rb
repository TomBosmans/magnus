class ContentGroup < Group
  default_scope { where_group_name('content') }

  def initialize(params = {})
    super(params)
    self.group = Group.find_or_create_by(name: 'content')
  end
end
