class LikeController < ApplicationController

  def new


  end


  def create

    @article = Article.find(params[:article_id])
     @like = @article.likes.new

    if @like.save
      redirect_to article_path(@article)
      flash[:success] = "La article a bien été ajoutée."
    else
      redirect_to article_index_path(params[:id])
      flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
    end

  end

end
