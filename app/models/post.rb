class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'

  # menthod to update the post counter for a given user
  after_save :update_post_counter_user

  private

  def update_post_counter_user
    author.increment!(:posts_counter)
  end

  # method to return 5 most recent comments for the post
  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
