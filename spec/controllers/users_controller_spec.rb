require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  it 'returns nil if user has not authenticated' do
    controller.authenticated?.should == nil
  end

  it 'prompts user to authenticate if user has not authenticated' do
    get :index
    expect(response).to redirect_to("/github/authenticate")
  end

end
