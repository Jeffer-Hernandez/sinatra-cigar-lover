class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
       user = User.find_by(email: params[:email])
       binding.pry
       if user && user.authenticate(params[:password])
        # creating a session for a user logs them in (creating a key value pair in the sessions hash)
        # take to home page
       else
        # error
        # try again
    
        redirect '/login'
    end


end