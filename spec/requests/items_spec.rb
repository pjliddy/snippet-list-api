# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Items", type: :request do
  def item_params
    {
      title: 'Test Title for a Snippet',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    }
  end

  def items
    Item.all
  end

  def item
    Item.first
  end

  before(:all) do
    Item.create!(item_params)
  end

  after(:all) do
    Item.delete_all
  end

  describe 'GET /items' do
    it 'lists all items' do
      get items_path
      expect(response).to have_http_status(200)
    end
  end

  # describe 'GET /articles' do
  #   it 'lists all articles' do
  #     get '/articles'
  #
  #     expect(response).to be_success
  #
  #     articles_response = JSON.parse(response.body)
  #     expect(articles_response.length).to eq(articles.count)
  #     expect(articles_response.first['title']).to eq(article['title'])
  #   end
end
