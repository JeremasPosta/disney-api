require 'rails_helper'

RSpec.describe "CastInMovies", type: :request do
  t_character = Character.create(image: "imagencita.jpg", name: "Lucas", age: 35, weight: 73, history: "Son of Vadercito")
  t_movie = Movie.create(image: "image.jpg", title: "Star Wars", realese: DateTime.now, qualification: 5, genre_id: Genre.last.id)
  
  let(:valid_attributes) {
    {movie_id: Movie.last.id, character_id: Character.last.id}
  }

  let(:invalid_attributes) {
    {image: 2, name: "", age: -1, weight: "J", history: "S"}
  }

  let(:valid_headers) {
    {"Authorization": get_authentication_token}
  }



  describe "GET /index" do
    it "renders a successful response" do
      CastInMovie.create! valid_attributes
      get cast_in_movies_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  it "does not create a new cast_in_movies relation" do
    expect {
      post cast_in_movies_url,
           params: { cast_in_movie: invalid_attributes }, as: :json
    }.to change(CastInMovie, :count).by(0)
  end

end
