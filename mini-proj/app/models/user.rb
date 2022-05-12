class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subscriptions, dependent: :destroy

  has_many :cats, through: :subscriptions, source: :cat

  def admin? 
    type == 'Admin'
  end
end
