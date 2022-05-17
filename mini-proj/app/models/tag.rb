class Tag < ApplicationRecord
  belongs_to :cat
  belongs_to :trait
  accepts_nested_attributes_for :trait, reject_if: :all_blank
end
