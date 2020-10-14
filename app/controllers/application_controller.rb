require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable sessions
    enable :sessions
    # set session secret for extra security
    set :session_secret, "secret_session"
    # register sinatra-flash gem functionality
    register Sinatra::Flash
  end

  get "/" do

    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
  end

  helpers do

    # returns a boolean for if user is logged in or not
    def logged_in?
      !!current_user
    end


    # keeps track of logged in user
    def current_user
      User.find_by(id: session[:user_id])

    end


  end

end
