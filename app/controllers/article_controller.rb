class ArticleController < ApplicationController




  def index

    @article = Article.all.order('created_at DESC')

  end


  def new


  end


  def create

    @article = Article.new(title: params[:title], subject: params[:subject], content:params[:content], img_desc: params[:img_desc], categorie_id: 1)

          if @article.save
            redirect_to root_path
            flash[:success] = "La article a bien été ajoutée."
          else
            redirect_to new_article_path
            flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
          end

  end



  def show


    @article = Article.find(params[:id])

    @comments = Article.find(params[:id]).comments.all

    @likes = Article.find(params[:id]).likes.all


    @visages = Categorie.find(1).articles.all.limit(4).order('created_at DESC')

    @engages = Categorie.find(2).articles.all.limit(4).order('created_at DESC')

    @experts = Categorie.find(3).articles.all.limit(4).order('created_at DESC')


  end




  def edit
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  @articleup = Article.find(params[:id])


  end



  def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  @articleup = Article.find(params[:id])



      if @articleup.update(title: params[:title], subject: params[:subject], content:params[:content],categorie_id: params[:categorie_id])
        redirect_to article_path
      else
        render :edit
      end

  end





  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @articledel = Article.find(params[:id])


      if @articledel.destroy
        redirect_to article_index_path
      else
        redirect_to article_path
      end


    end


    def is_admin?
      # check if user is a admin
      # if not admin then redirect to where ever you want
      redirect_to root_path unless current_user.is_admin == true
    end




end
