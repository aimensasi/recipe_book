class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role , default: "user"
      t.string :about
      t.string :avatar
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
