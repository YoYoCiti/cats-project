class Cat < ApplicationRecord
    has_many :subscriptions, dependent: :destroy
    has_many :subscribers, through: :subscriptions, source: :user

    has_many :cat_posts, dependent: :destroy
    has_one :buddy, :class_name => "Cat"

    has_many :tags, dependent: :destroy
    has_many :traits, through: :tags, source: :trait 
    accepts_nested_attributes_for :tags, allow_destroy: true
    accepts_nested_attributes_for :traits

    has_one_attached :image

    validates :name, presence: true
    validates :gender, presence: true, inclusion: %w(male female)
    validates :birthday, presence: true 
    validates :description, presence: true
    validates :image, presence: true
end
