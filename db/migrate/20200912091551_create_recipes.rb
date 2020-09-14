class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name, null: false, index: true
      t.text :ingredient
      t.text :how_to_cook
      t.text :pfc
      t.string :image_id
      t.timestamps
    end
  end
end
