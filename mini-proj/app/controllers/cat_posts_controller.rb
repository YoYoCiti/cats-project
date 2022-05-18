class CatPostsController < ApplicationController
  before_action :admin_user 

  def new
    @cat_post = CatPost.new
  end

  def create
    @cat_post = CatPost.new(cat_post_params)
    if @cat_post.save 
      flash[:success] = "Post created!"
      redirect_to cats_path
    else 
      render 'new'
    end
  end

  private 
    def cat_post_params 
      params.require(:cat_post).permit(:content, :cat_id, :user_id, images: [])
    end
end
