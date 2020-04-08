class ArticlesController < ApplicationController
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

  private
  def article_clear 
    params.require(:article).permit(:title, :content)
  end
end
