require 'rails_helper'

RSpec.describe "/genres", type: :request do
  let(:valid_attributes) {
    {image: "image.jpg", name: "Sci-Fi"}
  }

  let(:invalid_attributes) {
    {image: "g", name: 4}
  }
  
  let(:valid_headers) {
    {"Authorization": get_authentication_token}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Genre.create! valid_attributes
      get genres_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      genre = Genre.create! valid_attributes
      get genre_url(genre), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Genre" do
        expect {
          post genres_url,
               params: { genre: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Genre, :count).by(1)
      end

      it "renders a JSON response with the new genre" do
        post genres_url,
             params: { genre: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Genre" do
        expect {
          post genres_url,
               params: { genre: invalid_attributes }, as: :json
        }.to change(Genre, :count).by(0)
      end

      it "renders a JSON response with errors for the new genre" do
        post genres_url,
             params: { genre: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {image: "image2.jpg", name: "Fantasy"}
      }

      it "updates the requested genre" do
        genre = Genre.create! valid_attributes
        patch genre_url(genre),
              params: { genre: new_attributes }, headers: valid_headers, as: :json
        genre.reload
      end

      it "renders a JSON response with the genre" do
        genre = Genre.create! valid_attributes
        patch genre_url(genre),
              params: { genre: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the genre" do
        genre = Genre.create! valid_attributes
        patch genre_url(genre),
              params: { genre: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested genre" do
      genre = Genre.create! valid_attributes
      expect {
        delete genre_url(genre), headers: valid_headers, as: :json
      }.to change(Genre, :count).by(-1)
    end
  end
end
