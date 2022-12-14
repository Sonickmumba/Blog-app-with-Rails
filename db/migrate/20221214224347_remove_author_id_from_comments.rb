class RemoveAuthorIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :authorId, :integer
  end
end
