class Country < ActiveRecord::Base
  has_many :states
  before_save :downcase_name
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
    def downcase_name
      self.name = name.downcase
    end
end
