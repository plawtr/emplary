class Item < ActiveRecord::Base
  # asparagus
  belongs_to :category
  delegate :provider, :to => :category, :allow_nil => false
  delegate :source, :to => :provider, :allow_nil => false
  
  has_one :location, :as => :locatable
  acts_as_mappable :through => :category 
  validates :name, :link, :category, presence: true
end