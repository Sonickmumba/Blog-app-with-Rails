require 'swagger_helper'

RSpec.describe 'Blogs API' do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          bio: { type: :string },
          photo: { type: :string },
          password: { type: :string },
          posts_counter: { type: :integer },
          role: { type: :string }
        },
        required: %w[name email bio photo password posts_counter role]
      }

      response '201', 'user created' do
        let(:user) do
          { name: 'Doe', email: 'jamiemumba@gmail.com', bio: 'doctor', photo: 'url photo', password: 'password12',
            posts_counter: 1, role: 'admin' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'sonick' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/' do
    get 'Retrieves The List of Users' do
      tags 'Users'
      produces 'application/json'
      # parameter name: :id, :in => :path, :type => :string

      response '200', 'list of users' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 email: { type: :string },
                 bio: { type: :string },
                 photo: { type: :string },
                 password: { type: :string },
                 posts_counter: { type: :integer },
                 role: { type: :string }
               },
               required: %w[id name email bio photo password posts_counter role]

        run_test!
      end
    end
  end
end
