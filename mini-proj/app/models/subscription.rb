class Subscription < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :cat_id, presence: true 
  validates :user_id, presence: true 

  def self.cats_subscription_count
    Subscription.distinct.pluck(:cat_id).size
  end

  def self.user_subscription_count
    Subscription.distinct.pluck(:user_id).size
  end
end
