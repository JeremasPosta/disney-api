require 'rails_helper'

RSpec.describe "Greetings", type: :request do
  describe "GET /hello" do
    it "returns http success" do
      get "/greetings/hello"
      expect(response).to have_http_status(:success)
    end
  end

end
