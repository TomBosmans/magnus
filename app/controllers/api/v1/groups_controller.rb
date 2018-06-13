class Api::V1::GroupsController < ApiController
  def index
    groups = Group.all
    jbuilder = GroupJbuilder.index(groups)

    json_response jbuilder.target!
  end

  def show
    group = Group.find(params[:id])
    jbuilder = GroupJbuilder.show(group)

    json_response jbuilder.target!
  end
end
