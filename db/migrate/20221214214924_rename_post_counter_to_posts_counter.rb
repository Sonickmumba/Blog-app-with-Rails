class RenamePostCounterToPostsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :postCounter, :posts_counter
  end
end
