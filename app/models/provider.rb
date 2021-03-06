class Provider < ActiveRecord::Base
  # Ocado
  has_paper_trail  
  nilify_blanks
  
  has_many :locations, :as => :locatable
  acts_as_mappable :through => :locations

  has_and_belongs_to_many :sources
  has_and_belongs_to_many :categories
  has_many :items, through: :categories 
  validates :name, :website, presence: true, uniqueness: true

  scope :located_within, ->(bounds) { joins(:locations).where(locations: {id: Location.in_bounds(bounds).pluck(:id)}).uniq}
end
