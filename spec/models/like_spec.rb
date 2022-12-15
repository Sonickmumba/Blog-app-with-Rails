require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Test cases for likes table' do
    before(:each) do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                            posts_counter: 1)
      @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                          likes_counter: 9)
      @likes = Like.create(author: @author, post: @post)
    end

    it 'is valid with valid attributes' do
      expect(@likes).to be_valid
    end

    it 'is not valid without a author attribute' do
      @likes.author = nil
      expect(@likes).to_not be_valid
    end

    it 'is not valid without a post attribute' do
      @likes.post = nil
      expect(@likes).to_not be_valid
    end

    it 'should be valid with increment of likes counter post' do
      @likes.update_likes_counter_post
      expect(@post.likes_counter).to be(10)
    end
  end
end
