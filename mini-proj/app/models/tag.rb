class Tag < ApplicationRecord
  belongs_to :cat
  belongs_to :trait
end
