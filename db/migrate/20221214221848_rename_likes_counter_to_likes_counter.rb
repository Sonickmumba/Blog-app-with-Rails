class RenameLikesCounterToLikesCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :likesCounter, :likes_counter
  end
end
