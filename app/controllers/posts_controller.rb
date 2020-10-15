class PostsController < ApplicationController

    # CREATE

    get '/posts/new' do
        if logged_in?
            # a user is only authorized to post if they are logged in
            erb :'/posts/new'
        else
            # flash error
            flash[:error] = "You must be logged in to review!"
            # redirect to homepage so the user may log in
            redirect "/"
        end

    end

    post '/posts' do
        # create a post and persist to database
        post = Post.new(title: params[:title], description: params[:description],
        image_url: params[:image_url], user_id: current_user.id)

        # create a post and persist to database
        # .save triggers the validation, so we know that if the post saves, it is valid and all fields are filled in.
        if post.save
            # flash a success message that the post was created successfully
            flash[:message] = "Your post was created successfully. Great job!" 
            # redirect to post show page
            redirect "/posts/#{post.id}"
        else
            # flash an error message of post creation failure
            flash[:error] = "Post creation failed: #{post.errors.full_messages.to_sentence}"
            # redirect to post creation page so the user may try again
            redirect "/posts/new"
        end

    end

    # READ Functionality needs CREATE to go first
    # READ

    # index route for all posts
    get '/posts' do
        # render all posts
        @posts = Post.all
        # render index page with all posts belonging to the user
        erb :'/posts/index'
    end

    # show route for single posts
    get '/posts/:id' do
        @post = Post.find(params[:id])
        
        erb :'/posts/show'
    end


    # UPDATE
    # This route will only be triggered if a user is authorized to update or delete a post
    # The conditional statement is on the 'post/show' page
    get '/posts/:id/edit' do
        # find post in question from the database and create and instance variable
        @post = Post.find(params[:id])
        # render to post edit form
        erb :'/posts/edit'  
    end

    # Need to have Rack::MethodOverrride in config.ru to make Patch and Delete requests
    patch '/posts/:id' do
        
        # find correct post to edit
        @post = Post.find(params[:id])

        # conditional that prevents hacking
        if authorized_to_edit?(@post)
            # use update to take edits from params and update the post in the database
            @post.update(title: params[:title], description: params[:description],
            image_url: params[:image_url]) 
        else
            # flash error
            flash[:error] = "You can not edit a review that is not yours!"
        end

        # redirect to show page to view updated post
        redirect "/posts/#{@post.id}"           
   
    end

    # DELETE

    delete '/posts/:id' do
        # find post from :id param
        # dont need find_by because we are using :id to search
        @post = Post.find(params[:id])
        # destroy post/ delete from database
        @post.destroy
        # redirect back to index page to show all post, minus the one that was deleted
        redirect '/posts'
    end

end
