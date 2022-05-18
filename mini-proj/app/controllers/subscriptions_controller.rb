class SubscriptionsController < ApplicationController
  before_action :logged_in_user

  def create
    @cat = Cat.find(params[:cat_id])
    current_user.subscribe(@cat)
    redirect_to @cat
  end

  def destroy
    @cat = Subscription.find(params[:id]).cat
    current_user.unsubscribe(@cat)
    redirect_to @cat
  end
end
