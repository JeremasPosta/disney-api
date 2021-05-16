require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe 'GET index' do
    it 'returns a full JSON list' do
      get('/characters')
      json = JSON.parse(response.body)
      expect(json.size).to eql(2)
    end
  end
end
