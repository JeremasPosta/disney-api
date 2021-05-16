require 'rails_helper'

RSpec.describe "Statuses", type: :request do
  describe "GET /index" do
    it 'returns a status message' do
      get('/status')
      json = JSON.parse(response.body)
      expect(json['status']).to eql('ok')
     end
  end
end
