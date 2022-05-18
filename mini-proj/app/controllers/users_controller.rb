class UsersController < ApplicationController
    def show 
        @user = User.find(params[:id])
    end

    def cats 
        @user = User.find(params[:id])
        @cats = @user.cats 
        render 'show_cats'
    end
end
