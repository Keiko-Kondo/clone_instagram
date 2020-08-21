class Picture < ApplicationRecord
  validates :comment, presence: true
end
