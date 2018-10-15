class Admin::GroupsController < AdminController
  def show
    group = Group.find(params[:id])
    render locals: { group: group }
  end
end
