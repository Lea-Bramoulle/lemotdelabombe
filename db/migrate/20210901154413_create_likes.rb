class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.belongs_to :article, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end
