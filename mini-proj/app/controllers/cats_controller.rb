class CatsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @cat = Cat.new 
    @cat.tags.build 
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
    @cats = Cat.all.includes(image_attachment: [:blob], tags: [:trait])
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

  private 
    def cat_params 
      params.require(:cat).permit(:name, :gender, :birthday, :description, :image, 
                                  tags_attributes: [:id, :cat_id, :trait_id, :_destroy, 
                                  trait_attributes: [:id, :description, :_destroy]])
    end
end
