class CallbacksController < ApplicationController
  def new
    session_code = request.env['rack.request.query_hash']['code']
    result = RestClient.post('https://github.com/login/oauth/access_token',
    {:client_id => ENV['GITHUB_CLIENT_ID'],
      :client_secret => ENV['GITHUB_CLIENT_SECRET'],
      :code => session_code},
      :accept => :json)
    session[:accessToken] = JSON.parse(result)['access_token']
    redirect_to "/users/show"
  end
end
