class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_commit :add_default_avatar, on: %i[create update]
  
  has_many :subscriptions, dependent: :destroy

  has_many :cats, through: :subscriptions, source: :cat

  has_one_attached :avatar 

  def admin? 
    type == 'Admin'
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
