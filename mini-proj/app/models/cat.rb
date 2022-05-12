class Cat < ApplicationRecord
    has_many :subscriptions, dependent: :destroy
    has_many :subscribers, through: :subscriptions, source: :user

    has_many :cat_posts, dependent: :destroy
    has_one :buddy, :class_name => "Cat"

    has_many :tags, dependent: :destroy
    has_many :traits, through: :tags, source: :trait 
end
