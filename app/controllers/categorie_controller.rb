class CategorieController < ApplicationController


  def show

    @articles = Categorie.find(params[:id]).articles.all
    @categorie = Categorie.find(params[:id])

    @visages = Categorie.find(1).articles.all.limit(4).order('created_at DESC')

    @engages = Categorie.find(2).articles.all.limit(4).order('created_at DESC')

    @experts = Categorie.find(3).articles.all.limit(4).order('created_at DESC')



  end


end
