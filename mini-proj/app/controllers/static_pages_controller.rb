class StaticPagesController < ApplicationController
  before_action :admin_user, only: [:stats]

  layout "home"

  def home
    @cats = user_signed_in? ? (current_user.browse) : (Cat.includes(image_attachment: [:blob], tags: [:trait]).all)
  end

  def stats 
    @subscribed_cat_count = Subscription.distinct.pluck(:cat_id).count
    @unsubscribed_cat_count = Cat.count - @subscribed_cat_count
    @subscribed_user_count = Subscription.distinct.pluck(:user_id).count
    @unsubscribed_user_count = User.count - @subscribed_user_count
  end
end
