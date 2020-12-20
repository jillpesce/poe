class FixAuthorName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :author, :title
  end
end
