class CategorieController < ApplicationController


  def show

    @articles = Categorie.find(params[:id]).articles.all
    @categorie = Categorie.find(params[:id])

  end


end
