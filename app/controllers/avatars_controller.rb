class AvatarsController < ApplicationController


  def create
    @article = Article.find(params[:article_id])
    @article.avatar.attach(params[:avatar])
    redirect_to(article_path(@article))
  end


end
