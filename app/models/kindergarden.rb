class Kindergarden < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :phone, presence: true
  validates :city, presence: true

end
