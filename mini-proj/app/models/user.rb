class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_commit :add_default_avatar, on: %i[create update]
  
  has_many :subscriptions, dependent: :destroy

  has_many :cats, through: :subscriptions, source: :cat

  has_one_attached :avatar 

  # Returns true if user is admin
  def admin? 
    type == 'Admin'
  end

  # Subscribes to a cat
  def subscribe(cat)
    cats << cat
    UserMailer.subscription_notice(self ,cat).deliver_later
  end 

  # Unsubscribe to a cat
  def unsubscribe(cat) 
    cats.delete(cat) 
  end

  # Returns true if user is subscribed to the cat
  def subscribed?(cat)
    cats.include?(cat)
  end 

  # Returns cats that user is not subscribed to 
  def browse 
    subscribed_cat_ids = User.joins(:subscriptions).where(id: id).pluck(:cat_id)
    Cat.includes(:traits, image_attachment: [:blob]).where.not(id: subscribed_cat_ids)
  end

  # Returns user feed
  def feed 
    subscribed_cat_ids = User.joins(:subscriptions).where(id: id).pluck(:cat_id)
    CatPost.includes(images_attachments: [:blob], cat: [:traits, image_attachment: [:blob]]).where(cat_id: subscribed_cat_ids)
  end

  private 
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_user.jpg' 
          )
        ), 
        filename: 'default_user.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
