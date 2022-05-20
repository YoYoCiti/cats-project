class UsersController < ApplicationController
    before_action :logged_in_user, only: [:cats, :feed, :show]
    before_action :admin_user, only: [:index]

    def show 
        @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
    end

    def index
        @users = User.all 
        respond_to do |format|
            format.xlsx
        end
    end

    def cats 
        @user = User.find(params[:id])
        @cats = @user.cats.includes(image_attachment: [:blob], tags: [:trait])
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
