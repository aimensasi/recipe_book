class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :serving
      t.integer :preparation_time_hours
      t.integer :preparation_time_minutes
      t.integer :cooking_time_hours
      t.integer :cooking_time_minutes
      t.string :avatar
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
