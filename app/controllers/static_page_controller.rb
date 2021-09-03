class StaticPageController < ApplicationController

  def index

    @articles_last = Article.all.limit(4).order('created_at DESC')

  end

  def blog

  end


  def article

  end

  def littleberlin

  end


end
