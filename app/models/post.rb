class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy

  # post validations.
  validates :title, presence: true, length: { maximum: 250 }, allow_blank: false
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # menthod to update the post counter for a given user
  after_save :update_post_counter_user

  def update_post_counter_user
    author.increment!(:posts_counter)
  end

  # method to return 5 most recent comments for the post
  def recent_comments
    Comment.includes(:author).order(created_at: :desc).limit(5)
  end
end
