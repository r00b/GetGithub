require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #authenticate" do
    it "redirects to users/authenticate if user has not authenticated" do
      get :show
      expect(response).to redirect_to("/users/authenticate")
    end

    it "rescues and redirects to users/authenticate if access_token is invalid" do
      get :show
      session[:accessToken] = 'test'
      expect(response).to redirect_to("/users/authenticate")
    end
  end

  describe "authenticate check" do
    it 'returns nil if user has not authenticated' do
      controller.authenticated?.should == nil
    end

    it 'returns session[:accessToken] if user has authenticated' do
      session[:accessToken] = 'test'
      controller.authenticated?.should == session[:accessToken]
    end
  end

end
