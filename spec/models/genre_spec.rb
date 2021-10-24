require 'rails_helper'

RSpec.describe Genre, type: :model do
  subject{Genre.new(image: "image.jpg", name: "Sci-Fi")}
  t_movie = Movie.new(image: "image.jpg", title: "Star Wars", realese: DateTime.now, qualification: 5, genre_id: Genre.last.id)
  before (:each) {subject.save}

  context "at creation" do
    it "name should be present" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "name should be at least 1 character" do
      subject.name = "A"
      expect(subject).to be_valid
    end

    it "image should be present" do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it "image should be at least 2 character" do
      subject.image = "A"
      expect(subject).to_not be_valid
    end

    it "image should not be too short" do
      subject.image = "Ab"
      expect(subject).to be_valid
    end

    it "should have a has_many movies relationship" do
      t_subject = Genre.reflect_on_association(:movies)
      expect(t_subject.macro).to eq(:has_many)
    end

    it "should hold an associated movie" do
      subject.movies << t_movie
      expect(subject.movies.first).to have_attributes(title: t_movie.title)
    end

  end

end
