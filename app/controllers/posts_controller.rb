class PostsController < ApplicationController

    before_action :is_logged_in?, only: [:new, :create]
    def index
        @current_user = session[:current_user_id]
        if @current_user.member == "premium"
            flash[:notice] = "Welcome premium member!"
        end
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_parameters)
        if @post.save
            redirect_to edit_post_path(@post)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private 
    def post_parameters
        params.expect(post: [:title, :desc, :user_id])
    end
end
