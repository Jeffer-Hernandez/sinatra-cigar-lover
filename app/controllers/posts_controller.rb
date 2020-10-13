class PostsController < ApplicationController

    # CRUD





    # CREATE

    get '/posts/new' do

        erb :'/posts/new'
    end

    post '/posts' do
        post = Post.create(title: params[:title], description: params[:description],
        image_url: params[:image_url], user_id: current_user.id)    
        
        redirect "/posts/#{post.id}"
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
    # need to have Rack::MethodOverrride in config.ru to make Patch and Delete requests
    get '/posts/:id/edit' do
        # find correct post to render in form for edit.
        @post = Post.find(params[:id])

        erb :'/posts/edit'
    end

    patch '/posts/:id' do
        # find correct post to edit
        @post = Post.find(params[:id])
        # use update to take edits from params and update the post in the database
        @post.update(title: params[:title], description: params[:description],
        image_url: params[:image_url]) 
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
