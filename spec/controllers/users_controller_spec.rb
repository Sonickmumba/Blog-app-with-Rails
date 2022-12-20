require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('users')
      expect(response.body).to include('The page displays the list of users for the Blog app')
    end
  end

  describe 'users#show' do
    it 'render the show template' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts')
      expect(response.body).to include('The page displays the posts for given user')
    end
  end
end
