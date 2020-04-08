class ArticlesController < ApplicationController

  before_action :find_article, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_clear)
    if @article.save
      redirect_to articles_path, notice: "已發布消息!"    
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_clear)
      redirect_to articles_path, notice: "已修改文章!"    
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "已刪除文章!"
  end

  private
  def article_clear 
    params.require(:article).permit(:title, :content)
  end
  def find_article
    @article = Article.find(params[:id])
  end
end
