class RemoveTimestampFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :timestamp, :datetime
  end
end
