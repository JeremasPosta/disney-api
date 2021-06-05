require "rails_helper"

RSpec.describe ScreenShowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/screen_shows").to route_to("screen_shows#index")
    end

    it "routes to #show" do
      expect(get: "/screen_shows/1").to route_to("screen_shows#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/screen_shows").to route_to("screen_shows#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/screen_shows/1").to route_to("screen_shows#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/screen_shows/1").to route_to("screen_shows#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/screen_shows/1").to route_to("screen_shows#destroy", id: "1")
    end
  end
end
