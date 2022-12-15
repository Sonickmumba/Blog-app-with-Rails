class RenameCommentCounterToCommentsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :commentCounter, :comments_counter
  end
end
