require 'rails_helper'

describe "post a place route", :type => :request do

  before do
    post '/places', params: { :name => 'test_name'}
  end

  it 'returns the name name' do
    expect(JSON.parse(response.body)['name']).to eq('test_name')
  end

  # it 'returns the place review' do
  #   expect(JSON.parse(response.reviews.find['content']).to eq('test_content')
  # end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
