require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "comments#create action" do
    it "should allow users to create comments on places" do
      @place = FactoryBot.create(:place)

      post :create, params: { place_id: @place.id, comment: { description: 'Awesome place' } }

      expect(response).to redirect_to place_path(@place)
      expect(@place.comments.length).to eq 1
      expect(@place.comments.first.description).to eq "Awesome place"
    end

    it "should return http status code of not found if the place isn't found" do
      post :create, params: { place_id: 'YOLOSWAG', comment: { description: 'Awesome place' } }
      expect(response).to have_http_status :not_found
    end

end
end
