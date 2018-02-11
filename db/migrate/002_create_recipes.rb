class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :user_id
    end
  end
end
