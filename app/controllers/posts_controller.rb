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

    # ORDER MATTERS = READ Functionality needs CREATE to go first
    # READ
    # index route for all posts
    

    get '/posts' do
        # render all posts
        
        @posts = Post.all
        
        
        erb :'/posts/index'
    end
    # show route for single posts
    get '/posts/:id' do
        @post = Post.find(params[:id])
        
        erb :'/posts/show'
    end


    # UPDATE


    # DELETE


end
