require 'rails_helper'

RSpec.describe 'Post show page', type: :system do
  describe 'post show page' do
    before(:each) do
      @user2 = User.create(name: 'Jimmy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 3)
      visit root_path

      @post1 = Post.create(author: @user2, title: 'My First rails Post', text: 'This is my first Ruby on Rails post',
                           comments_counter: 1, likes_counter: 1)
      @post2 = Post.create(author: @user2, title: 'My second rails Post', text: 'This is my second Ruby on Rails post',
                           comments_counter: 2, likes_counter: 2)
      @post3 = Post.create(author: @user2, title: 'My third rails Post', text: 'This is my third Ruby on Rails post',
                           comments_counter: 3, likes_counter: 3)
      @post4 = Post.create(author: @user2, title: 'My fourth rails Post', text: 'This is my fourth Ruby on Rails post',
                           comments_counter: 4, likes_counter: 5)
      visit user_path(@user2.id)

      @comment1 = Comment.create(post: @post1, author: @user2, text: 'Hi Jimmy!')
      @comment2 = Comment.create(post: @post2, author: @user2, text: 'Hi love you!')

      visit user_post_path(@user2, @post1)
    end

    scenario 'I can see a post\'s title' do
      expect(page).to have_content('Post')
      expect(page).to have_content('This is my first Ruby on Rails post')
    end

    scenario 'I can see who wrote the post' do
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see how many comments it has' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    scenario 'I can see how many likes it has' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    scenario 'I can see the post body' do
      expect(page).to have_content('This is my first Ruby on Rails post')
    end

    scenario 'I can see the username of each commentor.' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.author.name)
    end

    scenario 'I can see the comment each commentor left.' do
      expect(page).to have_content('Hi Jimmy!')
    end
  end
end
