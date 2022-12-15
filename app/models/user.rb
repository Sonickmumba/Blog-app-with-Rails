class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  # method to return 3 most recent posts for a given user
  def recent_post
    Post.order(created_at: :desc).limit(3)
  end
end