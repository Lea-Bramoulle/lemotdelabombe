class Article < ApplicationRecord

  belongs_to :categorie
  has_many :likes
  has_many :comments

  has_one_attached :avatar

end
