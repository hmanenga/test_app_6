class ArticlesController < ApplicationController
  #before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    #binding.break
  @articles=Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article= Article.find(params[:id])
  end

  #GET  /articles/new(.:format)
  def new
    @article=Article.new
  end

   # /articles(.:format)
  def create
    @article=Article.new(params.require(:article).permit(:title,:description))
    if @article.save
      flash[:notice]="Article was created successfuly."
      redirect_to articles_path(@article)
    else 
        render 'new'
    end
      #render plain: @article.errors.full_messages    
  end

  def edit
    @article=Article.find(params[:id])
  end
  
  def update
    @article=Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title,:description));
      flash[:notice]='Article updated successfully'
      redirect_to @article
    else 
      render 'edit'
    end
  end

end