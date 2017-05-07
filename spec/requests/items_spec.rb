require 'rails_helper'

RSpec.describe 'Items', type: :request do
  def item_params
    {
      title: 'Test Title for a Snippet',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit tempor.'
    }
  end

  context 'while signed in' do
    def user_params
      {
        email: 'alice@example.com',
        password: 'foobarbaz',
        password_confirmation: 'foobarbaz'
      }
    end

    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
    end

    before(:each) do
      post '/sign-up', params: { credentials: user_params }
      post '/sign-in', params: { credentials: user_params }

      @token = JSON.parse(response.body)['user']['token']
      @user_id = JSON.parse(response.body)['user']['id']
    end

    describe 'GET /items' do
      it 'lists all items' do
        get items_path,
              headers: headers
        expect(response).to be_success
        expect(response.body).not_to be_empty
      end
    end
  end
end
