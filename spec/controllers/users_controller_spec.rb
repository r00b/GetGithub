require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #authenticate' do
    context 'unauthenticated request' do
      it 'redirects to users/authenticate' do
        get :show
        expect(response).to redirect_to('/users/authenticate')
      end
    end

    context 'invalid access_token' do
      it 'rescues and redirects to users/authenticate' do
        session[:current_access_token] = 'invalid'
        get :show
        expect(response).to redirect_to('/users/authenticate')
      end
    end
  end

  describe 'authentication check' do
    context 'authenticated request' do
      it 'returns session[:current_access_token] if user has authenticated' do
        session[:current_access_token] = 'test'
        expect(controller.authenticated?).to eq(session[:current_access_token])
      end
    end

    context 'unauthenticated request' do
      it 'returns nil' do
        expect(controller.authenticated?).to eq(nil)
      end
    end
  end
end
