class UsersController < ApplicationController

  def authenticated?
    session[:accessToken]
  end

  def authenticate!
    redirect_to "/users/authenticate"
  end

  def show
    if !authenticated?
      authenticate!
    else
      begin
        client = Octokit::Client.new(:access_token => session[:accessToken])
        @user = client.user
      rescue => e # accessToken has expired
        session[:accessToken] = nil
        return authenticate! # go for re-authentication
      end
    end
  end
end
