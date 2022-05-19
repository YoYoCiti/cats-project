class StaticPagesController < ApplicationController
  layout "home"
  def home
    @cats = user_signed_in? ? (current_user.browse) : (Cat.includes(image_attachment: [:blob], tags: [:trait]).all)
  end
end
