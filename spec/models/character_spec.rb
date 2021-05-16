require 'rails_helper'

RSpec.describe Character, type: :model do
end



# require 'rails_helper'

# RSpec.describe "NewCharacterAllDataNeededJsonOks", type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#   describe "GET character#1" do
#     before do
#       get '/characters/1'
#     end
#     it "returns http success" do
#       expect(response).to have_http_status(:success)
#     end
#     it "JSON body response contains expected character atributes" do
#       json_response = JSON.parse(response.body)
#       expect(json_response).to include('image', 'name', 'age', 'weight', 'history', 'filmography')
#     end
#   end

# end

# RSpec.describe "CreateCharacter", type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#     describe "POST #index" do
#       context "with valid parameters" do
#         let(:valid_params) do
#           { character:{image: "image2.jpg", name: "Luke2", age: 35, weight: 73, history: "Son of Vader", filmography: "Any important really"}}
#         end

#         it "a new character" do
#           post "/characters", params: valid_params
#           expect(Character.last).to have_attributes valid_params[:character]
#         end
        
#       end
#   end

# end