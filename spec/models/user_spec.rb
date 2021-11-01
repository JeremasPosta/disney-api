require 'rails_helper'

RSpec.describe User, type: :model do
  subject{User.new(name: "Jeremias", password: "123456", email: "example2@example.com")}

  context "at creation" do
    it "should have an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should have a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "should have a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    
  end
  
end
