class CatPostsController < ApplicationController
  before_action :admin_user 

  def new
    @cat_post = CatPost.new
  end

  def create
    @cat_post = CatPost.new(cat_post_params)
    respond_to do |format|
      if @cat_post.save 
        format.html { 
          flash[:success] = "Post created!"
          redirect_to cats_path
        }
        format.json { render :show, status: :created, location: @cat_post }
      else 
        format.html { render :new }
        format.json { render json: @cat_post.errors, status: :unprocessable_entity}
      end
    end
  end

  private 
    def cat_post_params 
      params.require(:cat_post).permit(:content, :cat_id, :user_id, images: [])
    end
end
