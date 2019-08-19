require 'rails_helper'

describe "get all places route", :type => :request do
  let!(:places) { FactoryBot.create_list(:place, 20)}

  before { get '/places'}

  it 'returns all places' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
