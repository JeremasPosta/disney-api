require 'rails_helper'

RSpec.describe "AuthApiRequests", type: :request do
  let(:valid_sign_up){{"name": "Aquiles Bailo", "email": "aquiles@bailo.com", "password": "123123"}}
  let(:invalid_sign_up){{"name": "Aquiles Bailo", "email": "aquiles@bailo.com", "password": "123123", "role": "1"}}

  let(:valid_login){{"email": "aquiles@bailo.com", "password": "123123"}}
  let(:invalid_login){{"email": "aquiles@bailo.com", "password": "123"}}

  describe "POST /sign-up" do
    it "renders a successfull response" do
      post sign_up_url, params: valid_sign_up, as: :json

      expect(response).to be_successful
    end  
  end

  describe "POST /login" do
    it "renders a successfull response with an 'auth_token'" do
      post sign_up_url, params: valid_sign_up, as: :json
      post login_url, params: valid_login, as: :json

      expect(response).to be_successful
      expect(response.body).to include("auth_token")
    end
  end

end
