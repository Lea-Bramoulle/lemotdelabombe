class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

      t.string :title
      t.text :subject
      t.text :content

      t.belongs_to :categorie, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end
