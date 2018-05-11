class Admin::ArticlesController < AdminController
  def index
    redirect_to [:admin, group]
  end

  def new
    @form_object = ArticleForm.new
  end

  def create
    @form_object = ArticleForm.new(article_form_params)
    @article = @form_object.build_for(group)

    if @form_object.valid?(article: @article)
      @article.save
      redirect_to [:admin, group]
    else
      render :new
    end
  end

  private

  def group
    @group ||= Group.find(params[:group_id])
  end

  def article_form_params
    params.require(:article_form).permit(
      :article_name,
      :article_description,
      :article_content,
      article_thumbnail: []
    )
  end
end
