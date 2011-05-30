require 'sinatra/base'
require 'oauth2'

class Application < Sinatra::Base
  enable :sessions
  
  def client
    @client ||= OAuth2::Client.new '120094574673767', 'b54dc82476af2814e620b86776c42c0e', {
      :site => 'http://localhost:3000',
      :access_token_method => :post,
      :authorize_url => '/oauth2/authorize',
      :token_url     => '/oauth2/token',
      :adapter => :NetHttp,
    }
  end
  
  def oauth_callback_url
    'http://localhost:9393/oauth/callback'
  end
  
  get '/oauth/start' do
    redirect client.auth_code.authorize_url
  end
  
  get '/oauth/callback' do
    # TODO: Save access_token for future usage
    access_token = client.auth_code.get_token params[:code], :redirect_uri => oauth_callback_url
    access_token.get('/me').body
  end
end