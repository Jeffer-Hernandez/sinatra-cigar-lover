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
        # add a success message to the flash hash
        flash[:message] = "Welcome back, #{user.name}!"
        # take to home page
        redirect "/users/#{user.id}"
       else
        # error
        flash[:error] = "Your credentials were invalid. Please try again."
        # try again/ redirect back to login
        redirect '/login'
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
        user = User.new(params)

        if user.save
            # add key value pair to session hash
            session[:user_id] = user.id
            # flash success message for creation of usesr
            flash[:message] = "Welcome to Cigar Lover!"
            # redirect user to profile
            redirect "/users/#{user.id}"
        else
            # flash error message
            flash[:error] = "Failed sign-up attempt: #{user.errors.full_messages.to_sentence}"
            # reddirect to sign-up page to try again
            redirect "/signup"
        end

    end

    # get route that clears the session hash, logging the user out
    get '/logout' do
        session.clear

        #redirect to home page
        redirect '/'
    end


end