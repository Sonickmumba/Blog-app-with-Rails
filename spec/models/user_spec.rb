require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 1)

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a post counter greater than or equal to 0' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'is not valid without a post counter' do
    user.posts_counter = nil
    expect(user).to_not be_valid
  end

  it 'should return recent posts' do
    recent = User.new.recent_post
    expect(recent.length).to be(0)
  end
end
