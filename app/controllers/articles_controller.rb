class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new

  end

  def edit
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to @article
    end
  end

  def update
    if @article.update article_params
      redirect_to @article
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.turbo_stream { redirect_to root_path }
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
