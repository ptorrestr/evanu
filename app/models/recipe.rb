class Recipe < ApplicationRecord
  belongs_to :level
  belongs_to :category
	validates :name, uniqueness: true, presence: true
end
