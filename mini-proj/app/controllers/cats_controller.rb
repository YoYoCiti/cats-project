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
    if @cat.save
      flash[:success] = "Cat added!"
      redirect_to cats_path
    else 
      render 'new'
    end
  end

  def edit 
    @cat = Cat.find(params[:id])
  end

  def update 
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      flash[:success] = "Cat updated!"
      redirect_to cats_path
    else
      render 'edit'
    end 
  end

  def index 
    @cats = Cat.all.includes(image_attachment: [:blob], tags: [:trait])
  end

  def destroy 
    Cat.find(params[:id]).destroy 
    flash[:success] = "Cat deleted"
    redirect_to cats_path
  end

  private 
    def cat_params 
      params.require(:cat).permit(:name, :gender, :birthday, :description, :image, 
                                  tags_attributes: [:id, :cat_id, :trait_id, :_destroy, 
                                  trait_attributes: [:id, :description, :_destroy]])
    end
end
