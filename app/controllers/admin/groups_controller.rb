class Admin::GroupsController < AdminController
  def show
    @group = Group.find(params[:id])
    @table_object = GroupTable.new(resources: @group.items, group: @group)
  end
end
