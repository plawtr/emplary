class Item < ActiveRecord::Base
  # asparagus
  belongs_to :category
  belongs_to :provider
  delegate :sources, :to => :provider, :allow_nil => false
  
  has_many :locations, :as => :locatable, :through => :provider
  acts_as_mappable :through => :provider
  validates :name, :link, :category, presence: true
end