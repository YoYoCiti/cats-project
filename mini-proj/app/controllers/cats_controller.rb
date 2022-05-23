class CatsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy, :trash, :index]
  before_action :logged_in_user, only: [:cat_posts]

  def new
    @cat = Cat.new 
  end

  def show 
    @cat = Cat.find(params[:id])
  end

  def create 
    @cat = Cat.new(cat_params)
    respond_to do |format|
      if @cat.save
        format.html {
          flash[:success] = "Cat added!"
          redirect_to cats_path
        }
        format.json { render :show, status: :created, location: @cat }
      else 
        format.html{ render 'new' }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @cat = Cat.find(params[:id])
  end

  def update 
    @cat = Cat.find(params[:id])
    respond_to do |format|
      if @cat.update_attributes(cat_params)
        format.html {
          flash[:success] = "Cat updated!"
          redirect_to cats_path
        }
        format.json { render :show, status: :ok, location: @cat }
      else
        format.html { render 'edit' }
        format.json { render json: @cat.errors, status: :unprocessable_entity }
      end 
    end
  end

  def index 
    @cats = Cat.includes(image_attachment: [:blob], tags: [:trait]).all
  end

  def destroy 
    Cat.find(params[:id]).destroy 
    respond_to do |format|
      format.html {
        flash[:success] = "Cat deleted"
        redirect_to cats_path
      }
      format.json { head :no_content }
    end
  end

  def trash
    Cat.where(id: params[:trash][:cat_id].reject(&:blank?)).destroy_all
    respond_to do |format|
      format.html {
        flash[:success] = "Cats deleted"
        redirect_to cats_path
      }
      format.json { head :no_content }  
    end
  end

  def cat_posts 
    @cat = Cat.find(params[:id])
    @cat_posts = @cat.cat_posts.includes(images_attachments: [:blob])
    if current_user.subscribed?(@cat)
      render 'show_posts'
    else 
      flash[:danger] = "Add #{@cat.name} to your family to view their feed"
      redirect_to @cat
    end
  end

  private 
    def cat_params 
      params.require(:cat).permit(:name, :gender, :birthday, :description, :image, 
                                  tags_attributes: [:id, :cat_id, :trait_id, :_destroy, 
                                  trait_attributes: [:id, :description, :_destroy]])
    end
end
