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
      client = Octokit::Client.new(:access_token => session[:accessToken])
      @user = client.user
    end
  end
end
