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

    # CREATE

    # UPDATE


    # DELETE


end
