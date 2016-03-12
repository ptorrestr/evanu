class Kindergarden < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  validates :name, presence: true
  validates :phone, presence: true
  validates :city, presence: true
  validates :user, presence: true
end
