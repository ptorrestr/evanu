class City < ActiveRecord::Base
  belongs_to :county
  before_save :downcase_name
  validates :county, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :county }

  private
    def downcase_name
      self.name = name.downcase
    end
end
