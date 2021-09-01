class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.text :comment_content
      t.string :pseudo
      t.belongs_to :article, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end
