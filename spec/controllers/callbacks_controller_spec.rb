require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do

  describe "GET #new" do
    it "redirects back to users/show" do
      get :new
      expect(response).to redirect_to("/users/show")
    end
  end

end
