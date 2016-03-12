class County < ActiveRecord::Base
  belongs_to :state
  before_save :downcase_name
  validates :state, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :state }

  private
    def downcase_name
      self.name = name.downcase
    end
end
