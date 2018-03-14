class Food < ApplicationRecord
  belongs_to :user_id
	validates :name, presence: true, uniqueness: true
	validates :proteins, presence: true
	validates :carbohydrates, presence: true
	validates :fibre, presence: true
	validates :lipids, presence: true
end
