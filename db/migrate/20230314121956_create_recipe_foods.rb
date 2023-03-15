class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.integer :food_id
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
