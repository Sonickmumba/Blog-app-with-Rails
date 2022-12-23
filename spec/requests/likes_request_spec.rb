require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/:user_id/posts/id'
      expect(response).to have_http_status(:success)
    end
  end
end