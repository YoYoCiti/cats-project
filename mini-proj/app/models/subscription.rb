class Subscription < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :cat_id, presence: true 
  validates :user_id, presence: true 
end
