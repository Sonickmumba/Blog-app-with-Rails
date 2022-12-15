require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Test cases for comments table' do
    before(:each) do
      @author = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                            posts_counter: 1)
      @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                          likes_counter: 9)
      @likes = Like.create(author: @author, post: @post)
      @comment = Comment.create(post: @post, author: @author, text: 'Hi Sonick!')
    end

    it 'is valid with valid attributes' do
      expect(@comment).to be_valid
    end

    it 'text attribute should be present' do
      @comment.text = 'I am Mumba'
      expect(@comment).to be_valid
    end

    it 'post attribute should be present' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end

    it 'author attribute should be present' do
      @comment.author = nil
      expect(@comment).to_not be_valid
    end

    it 'should be valid with Comment methods' do
      @comment.update_comment_counter_post
      expect(@post.comments_counter).to be(2)
    end
  end
end
