class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
    params_id
  end

  def show
    params_id
  end

  def update
    params_id
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    params_id
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def params_id
      @article = Article.find(params[:id])
  end
end
