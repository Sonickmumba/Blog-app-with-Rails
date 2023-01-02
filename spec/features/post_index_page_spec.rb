require 'rails_helper'

RSpec.describe 'Post index page', type: :system do
  describe 'post index page' do
    before(:each) do
      @user2 = User.create(name: 'Jimmy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 5)
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
      visit user_posts_path(@user2.id)
    end
    scenario 'I can see the user\'s profile picture.' do
      expect(page).to have_css('div.user-icon')
    end
    scenario 'I can see the username of all other users' do
      expect(page).to have_content('Jimmy')
    end
    scenario 'I can see the number of posts the user has written' do
      post = Post.all
      expect(post.size).to eql(4)
    end
    scenario 'I can see a posts title' do
      expect(page).to have_content('Post')
      expect(page).to have_content('This is my first Ruby on Rails post')
    end
    scenario 'I can see some of the post\'s body' do
      expect(page).to have_content('This is my second Ruby on Rails post')
    end
    scenario 'I can see the first comments on a post' do
      expect(page).to have_content('Hi Jimmy!')
    end
    scenario 'I can see how many comments a post has.' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end
    scenario 'I can see how many likes a post has' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end
    scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(find_link('Pagination')).to be_visible
    end
    scenario 'When I click on a post, it redirects me to that post\'s show page' do
      click_on(@post1.id)
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
