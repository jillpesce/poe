class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.text :bio
      t.string :password_hash

      t.timestamps
    end
  end
end
