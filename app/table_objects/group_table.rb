class GroupTable < ApplicationTable
  attr_accessor :group

  def initialize(resources:, group:)
    super(resources)
    self.group = group

    table_actions.map do |action|
      action.options[:path] = action.options[:path].dup
      action.options[:path] = action.options[:path].call(group)
      action
    end
  end

  column :name,
         label: 'Name'

  column :description,
         label: 'Description'

  table_action :new_article,
               icon: 'add',
               path: ->(group) { [:new, :admin, group, :article] }
end
