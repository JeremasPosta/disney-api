require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject{Movie.new(image: "image.jpg", title: "Star Wars", realese: DateTime.now, qualification: 5, genre_id: Genre.last.id)}
  before (:each) {subject.save}

  
  context "at creation" do
    it "title should be present" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "title should be at least 1 character" do
      subject.title = "A"
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
      t_subject = Character.reflect_on_association(:movies)
      expect(t_subject.macro).to eq(:has_many)
    end

    it "should hold an associated genre" do
      expect(subject.genre).to have_attributes(name: Genre.last.name)
    end

  end

end
