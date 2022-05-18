class CatPost < ApplicationRecord
  belongs_to :user
  belongs_to :cat
  has_many_attached :images

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :cat_id, presence: true 
  validates :content, presence: true

end
