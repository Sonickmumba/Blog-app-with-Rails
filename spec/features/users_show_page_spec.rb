require 'rails_helper'

RSpec.describe 'Users Show  page', type: :feature do
  describe 'User show Page' do
    before(:each) do
      @user1 = User.create(name: 'Jimmy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 3)
      @user2 = User.create(name: 'Alex', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 9)
      @user3 = User.create(name: 'Gregory', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 2)
      @user4 = User.create(name: 'Peggy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 1)
      @user5 = User.create(name: 'Amina', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 0)
      @user5 = User.create(name: 'Danny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', posts_counter: 7)

      visit root_path

      @post1 = Post.create(author: @user1, title: 'My First Rails Post', text: 'This is my first Ruby on Rails post',
                           comments_counter: 1, likes_counter: 1)
      @post2 = Post.create(author: @user2, title: 'My Second Rails Post', text: 'This is my second Ruby on Rails post',
                           comments_counter: 2, likes_counter: 1)
      @post3 = Post.create(author: @user3, title: 'My Third Rails Post', text: 'This is my third Ruby on Rails post',
                           comments_counter: 3, likes_counter: 4)
      @post4 = Post.create(author: @user4, title: 'My Fourth Rails Post', text: 'This is my fourth Ruby on Rails post',
                           comments_counter: 4, likes_counter: 8)
      @post5 = Post.create(author: @user5, title: 'My Fifth Rails Post', text: 'This is my fifth Ruby on Rails post',
                           comments_counter: 4, likes_counter: 9)

      visit user_path(@user2.id)
    end

    scenario 'I can see the user\'s profile picture.' do
      expect(page).to have_css('div.user-icon')
    end

    scenario 'I can see the username of all other users' do
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see the number of posts the user has written' do
      expect(page).to have_content(9)
    end

    scenario 'I can see the user\'s bio' do
      expect(page).to have_content('Bio')
      expect(page).to have_content('Teacher From Country')
    end

    scenario 'I can see the user\'s first 3 posts' do
      @user1.recent_post.each do |post|
        expect(page).to have_content(post.id)
        expect(page).to have_content(post.text)
      end
    end

    scenario 'I can see a button that lets me view all of a user\'s posts' do
      expect(find_link('See all posts')).to be_visible
      expect(page).to have_link('See all posts')
    end

    scenario 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      click_on 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user2.id))
    end

    scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_on 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user2.id))
    end
  end
end
