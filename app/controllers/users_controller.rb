class UsersController < ApplicationController

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
       user = User.find_by(email: params[:email])
       
    #    binding.pry
       if user && user.authenticate(params[:password])
        # creating a session for a user logs them in (creating a key value pair in the sessions hash)
        session[:user_id] = user.id
        # take to home page
        redirect "/users/#{user.id}"
       else
        # error
        # try again
       end
    
        redirect '/users/login'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
    
        erb :'/users/show'
    end

    get '/signup' do
        
        erb :'/users/signup'
    end


    # post signup route that recieves input data from the user, creates the user, and 
    # logs the user in
    post '/users' do
        # will need to add validations to make sure all inputs are filled out before
        # creating a user
        @user = User.create(params)
        # add key value pair to session hash
        session[:user_id] = @user.id
        # redirect user to profile
        redirect "/users/#{@user.id}"
    end

    # get route that clears the session hash, logging the user out
    get '/logout' do
        session.clear

        #redirect to home page
        redirect '/'
    end


end