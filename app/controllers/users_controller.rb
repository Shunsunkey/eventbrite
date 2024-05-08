class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def show
        @user = current_user || User.find(params[:id])
    end
    def profile
        @user = User.find(params[:id])
    end

    def index
        @users = User.all

    end
  end
  