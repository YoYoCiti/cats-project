class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:stats]

  layout "home"

  def home
    @cats = user_signed_in? ? (current_user.browse) : (Cat.includes(:traits, image_attachment: [:blob]).all)
  end

  def stats 
    @subscribed_cat_count = Subscription.cats_subscription_count
    @unsubscribed_cat_count = Cat.count - @subscribed_cat_count
    @subscribed_user_count = Subscription.user_subscription_count
    @unsubscribed_user_count = User.count - @subscribed_user_count
  end
end
