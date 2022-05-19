class SubscriptionsController < ApplicationController
  before_action :logged_in_user

  def create
    @cat = Cat.find(params[:cat_id])
    current_user.subscribe(@cat)
    respond_to do |format|
      format.html { redirect_to @cat }
      format.js
    end
  end

  def destroy
    @cat = Subscription.find(params[:id]).cat
    current_user.unsubscribe(@cat)
    respond_to do |format|
      format.html { redirect_to @cat }
      format.js
    end
  end
end
