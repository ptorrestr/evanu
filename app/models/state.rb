class State < ActiveRecord::Base
  belongs_to :country
  has_many :counties
  before_save :downcase_name
  validates :country, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :country }

  private
    def downcase_name
      self.name = name.downcase
    end
end
