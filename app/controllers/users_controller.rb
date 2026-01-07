class UsersController < ApplicationController

    before_action :is_logged_in?, only: [:edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_parameters)
        if @user.save
            redirect_to edit_user_path(@user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_parameters)
            redirect_to edit_user_path(@user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private 
    def user_parameters
        params.expect(user: [:username, :email, :password, :member])
    end
end
