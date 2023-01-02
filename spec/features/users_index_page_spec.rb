require 'rails_helper'

RSpec.describe 'Users Index page', type: :feature do
  describe 'User Index Page' do
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
    end

    it 'I can see the username of all other users' do
      expect(page).to have_content('Jimmy')
      expect(page).to have_content('Alex')
      expect(page).to have_content('Gregory')
      expect(page).to have_content('Danny')
      expect(page).to have_content('Amina')
      expect(page).to have_content('Peggy')
    end

    it 'I can see the profile picture for each user' do
      all('img').each do |i|
        expect(i[:src]).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
      end
    end

    it 'I can see the number of posts each user has written' do
      expect(page).to have_content(3)
      expect(page).to have_content(9)
      expect(page).to have_content(2)
      expect(page).to have_content(0)
      expect(page).to have_content(7)
      expect(page).to have_content(1)
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_on 'Jimmy'
      expect(current_path).to eq user_path(@user1.id)
    end
  end
end
