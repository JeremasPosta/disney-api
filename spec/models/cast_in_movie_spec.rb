require 'rails_helper'

RSpec.describe CastInMovie, type: :model do
  subject{CastInMovie.new(character_id: 1, movie_id: 1)}
  
  context "at creation" do
    it "character_id should be present" do
      subject.character_id = nil
      expect(subject).to_not be_valid
    end

    it "movie_id should be present" do
      subject.movie_id = nil
      expect(subject).to_not be_valid
    end
  end

end
