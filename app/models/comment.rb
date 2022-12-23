class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  # method to update the comments counter for a given post
  after_save :update_comment_counter_post

  def update_comment_counter_post
    post.increment!(:comments_counter)
  end
end
