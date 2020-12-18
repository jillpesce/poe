class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :text
      t.datetime :timestamp
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
