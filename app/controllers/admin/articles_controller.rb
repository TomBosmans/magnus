class Admin::ArticlesController < AdminController
  def new
    @form_object = ArticleForm.new
  end

  private

  def group
    @group ||= Group.find(params[:group_id])
  end
end
