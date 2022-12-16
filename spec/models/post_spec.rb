require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Test cases for posts table' do
    before(:each) do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                            posts_counter: 1)
      @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                          likes_counter: 9)
    end

    it 'is valid with valid attributes' do
      expect(@post).to be_valid
    end

    it 'Title length shoud not be too long' do
      @post.title = 's' * 300
      expect(@post).to_not be_valid
    end

    it 'is not valid without a title attribute' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'is not valid without a comment counter greater than or equal to 0' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'is not valid without a likes counter attribute' do
      @post.likes_counter = ''
      expect(@post).to_not be_valid
    end

    it 'should return recent posts' do
      @post.update_post_counter_user
      expect(@author.posts_counter).to be(3)
    end
  end
end
