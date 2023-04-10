class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
 
  
  # GET /articles or /articles.json
  def index
    #binding.break
  @articles=Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
 
  end

  #GET  /articles/new(.:format)
  def new
    @article=Article.new
  end

   # /articles(.:format)
  def create
    @article=Article.new(article_params)
    if @article.save
      flash[:notice]="Article was created successfuly."
      redirect_to articles_path(@article)
    else 
        render 'new'
    end
      #render plain: @article.errors.full_messages    
  end

  def edit
  end
  
  def update
    if @article.update(article_params);
      flash[:notice]='Article updated successfully'
      redirect_to @article
    else 
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  private
  def set_article
    @article= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end
end