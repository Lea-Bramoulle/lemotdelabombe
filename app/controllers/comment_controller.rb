class CommentController < ApplicationController


  def new


  end


  def create

    @article = Article.find(params[:article_id])
     @comment = @article.comments.new(pseudo:params[:pseudo],comment_content: params[:comment_content])

    if @comment.save
      redirect_to article_path(@article)
      flash[:success] = "La article a bien été ajoutée."
    else
      redirect_to article_index_path(params[:id])
      flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
    end

  end


end
