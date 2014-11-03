class Category < ActiveRecord::Base
  # vegetables 
  has_paper_trail
  nilify_blanks
  
  has_and_belongs_to_many :providers
  has_many :items
  validates :name, presence: true, uniqueness: true

  scope :with_providers_within, ->(bounds) { joins(providers: :locations).where(locations: {id: Location.in_bounds(bounds).pluck(:id)}).uniq }

end
