class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  # method to update likes counter for a given post
  after_save :update_likes_counter_post

  def update_likes_counter_post
    post.increment!(:likes_counter)
  end
end
