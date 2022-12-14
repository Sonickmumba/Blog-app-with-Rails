class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  # User model validations
  validates :name, presence: true, allow_blank: false
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def admin?
    role == 'admin'
  end

  # method to return 3 most recent posts for a given user
  def recent_post
    Post.order(created_at: :desc).limit(3)
  end
end
