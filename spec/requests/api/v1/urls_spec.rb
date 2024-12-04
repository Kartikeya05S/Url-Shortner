require 'rails_helper'

RSpec.describe "API::V1::Urls", type: :request do
  describe "POST /api/v1/shorten" do
    let(:headers) { { "Authorization" => "YOUR_API_TOKEN" } }

    it "creates a shortened URL" do
      post "/api/v1/shorten", params: { original_url: "https://example.com" }, headers: headers
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['shortened_url']).not_to be_empty
    end

    it "returns unauthorized if token is missing" do
      post "/api/v1/shorten", params: { original_url: "https://example.com" }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end