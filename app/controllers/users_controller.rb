class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
      end

    def edit 
        @user.avatar.attach(params[:avatar])
    end
    
end
