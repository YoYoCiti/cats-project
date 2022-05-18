class StaticPagesController < ApplicationController
  layout "home"
  def home
    @cats = user_signed_in? ? (current_user.browse) : (Cat.all.includes(image_attachment: [:blob], tags: [:trait]))
  end
end
