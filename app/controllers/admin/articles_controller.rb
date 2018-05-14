class Admin::ArticlesController < AdminController
  def show
    article = Article.find(params[:id])
    @presenter = ArticlePresenter.new(article)
  end

  def new
    @form_object = ArticleForm.new
  end

  def create
    @form_object = ArticleForm.new(article_form_params)
    @article = @form_object.build_for(group)

    if @form_object.valid?(article: @article)
      @article.save
      redirect_to [:admin, @article]
    else
      render :new
    end
  end

  def edit
    article = Article.find(params[:id])
    @form_object = ArticleForm.new(article: article)
  end

  def update
    @article = Article.find(params[:id])
    @form_object = ArticleForm.new(article_form_params)
    @article.attributes = @form_object.article_attributes

    if @form_object.valid?(article: @article)
      @article.update_attributes(@form_object.article_attributes)
      redirect_to [:admin, @article]
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    group = @article.group
    @article.destroy
    redirect_to [:admin, group]
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
