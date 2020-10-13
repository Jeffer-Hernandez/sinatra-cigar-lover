class PostsController < ApplicationController

    # CRUD

    # READ
    # index route for all posts
    # show route for single posts

    get '/posts' do
        # render all posts
        @posts = Post.all
        
        erb :'/posts/index'
    end

    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :'/posts/show'
    end


    # CREATE

    # UPDATE


    # DELETE


end
