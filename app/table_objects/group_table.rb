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

  column :type,
         label: 'Type'

  resource_action :show,
                  icon: 'visibility',
                  path: ->(resource) { [:admin, resource.group, resource] }

  resource_action :edit,
                  icon: 'edit',
                  path: ->(resource) { [:edit, :admin, resource.group, resource] }

  resource_action :destroy,
                  icon: 'delete',
                  css_class: 'red-text',
                  path: ->(resource) { [:admin, resource.group, resource] },
                  method: 'DELETE'

  table_action :new_article,
               icon: 'add',
               path: ->(group) { [:new, :admin, group, :article] }
end
