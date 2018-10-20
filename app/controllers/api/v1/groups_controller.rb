class Api::V1::GroupsController < ApiController
  def index
    groups = Group.all
    render locals: { groups: groups, show_items: false }
  end

  def show
    group = Group.find(params[:id])
    render locals: { group: group, show_items: true }
  end
end
