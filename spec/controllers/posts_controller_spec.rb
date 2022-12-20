require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('The page displays the posts for given user')
      expect(response).to render_template('posts')
    end
  end

  describe 'posts#show' do
    it 'render the show template' do
      get '/users/2/posts/2'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('This page display the posts by a user and the Comments for that post')
      expect(response).to render_template('show')
    end
  end
end