class UsersController < ApplicationController
    before_action :logged_in_user, only: [:cats, :feed]

    def show 
        @user = User.find(params[:id])
    end

    def cats 
        @user = User.find(params[:id])
        @cats = @user.cats 
        render 'show_cats'
    end

    def feed 
        @user = User.find(params[:id])
        if current_user?(@user)
            @feed_posts = @user.feed
            render 'show_feed'
        else 
            redirect_to root_url
        end
    end
end
