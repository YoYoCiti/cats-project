class CatsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @cat = Cat.new 
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
      redirect_to @cat
    else
      render 'edit'
    end 
  end

  def index 
    @cats = Cat.all
  end

  def destroy 
    Cat.find(params[:id]).destroy 
    flash[:success] = "Cat deleted"
    redirect_to cats_path
  end

  private 
    def cat_params 
      params.require(:cat).permit(:name, :gender, :birthday, :description)
    end

    def admin_user 
      redirect_to(root_url) unless current_user.admin? 
    end
end
