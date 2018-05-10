class Admin::CollectionsController < ApplicationController
  def index
    group = Group.find_by(name: 'collections')
    @collections = group.items
  end

  def show
  end

  private

  def group
    @collections ||= Group.find_by(name: 'collections')
  end
end
