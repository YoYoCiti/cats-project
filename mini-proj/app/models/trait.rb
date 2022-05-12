class Trait < ApplicationRecord
    has_many :tags, dependent: :destroy
    has_many :cats, through: :tags, source: :cat
end
