class RemovePostIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :postId, :integer
  end
end
