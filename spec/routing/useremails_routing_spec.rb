require "rails_helper"

RSpec.describe UseremailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/useremails").to route_to("useremails#index")
    end

    it "routes to #new" do
      expect(get: "/useremails/new").to route_to("useremails#new")
    end

    it "routes to #show" do
      expect(get: "/useremails/1").to route_to("useremails#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/useremails/1/edit").to route_to("useremails#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/useremails").to route_to("useremails#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/useremails/1").to route_to("useremails#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/useremails/1").to route_to("useremails#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/useremails/1").to route_to("useremails#destroy", id: "1")
    end
  end
end
