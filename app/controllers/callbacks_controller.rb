class CallbacksController < ApplicationController

  def new
    # extract temporary API code from the return URL
    session_code = request.env['rack.request.query_hash']['code']
    # POST the code back to GitHub
    result = RestClient.post('https://github.com/login/oauth/access_token',
    {:client_id => ENV['GITHUB_CLIENT_ID'],
      :client_secret => ENV['GITHUB_CLIENT_SECRET'],
      :code => session_code},
      :accept => :json)
    # extract the access_token from the response
    session[:current_access_token] = JSON.parse(result)['access_token']
    redirect_to "/users/show"
  end
end
