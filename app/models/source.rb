class Source < ActiveRecord::Base
  # online groceries OR eating out
  has_paper_trail
  nilify_blanks
  
  has_and_belongs_to_many :providers
  has_many :categories, through: :providers
  has_many :items, through: :providers
  validates :name, presence: true, uniqueness: true

  scope :with_providers_within, ->(bounds) { joins(:categories, :items, providers: :locations).where(locations: {id: Location.in_bounds(bounds).pluck(:id)}).uniq }
end
