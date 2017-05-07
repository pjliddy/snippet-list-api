# frozen_string_literal: true

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

    def items
      Item.all
    end

    after(:all) do
      Item.delete_all
    end

    before(:each) do
      post '/sign-up', params: { credentials: user_params }
      post '/sign-in', params: { credentials: user_params }

      @current_user = JSON.parse(response.body)['user']
      @token = JSON.parse(response.body)['user']['token']
      @user_id = JSON.parse(response.body)['user']['id']

      post items_path, headers: headers,
                       params: { item: item_params }

      @item = JSON.parse(response.body)['item']
    end

    describe 'GET /items' do
      it 'lists all items' do
        # make api request with headers for authenticated user
        get items_path, headers: headers
        # response is a success (200 or 204)
        expect(response).to be_success
        # body of response is not empty
        expect(response.body).not_to be_empty
        # parse body of response
        items_response = JSON.parse(response.body)
        # number of items in response is same
        expect(items_response['items'].length).to eq(items.count)
        # value of item in response is same
        expect(items_response['items'].first['title']).to eq(@item['title'])
      end
    end
  end
end
