class UsersController < ApplicationController

  def authenticated?
    session[:current_access_token]
  end

  def authenticate!
    redirect_to "/users/authenticate"
  end

  def show
    if !authenticated?
      authenticate!
    else
      begin
        client = Octokit::Client.new(:access_token => session[:current_access_token])
        @user = client.user
      rescue => e # currrent_access_token has expired
        session[:current_access_token] = nil
        return authenticate! # put user back through authentication flow
      end
    end
  end
  
end
