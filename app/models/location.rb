class Location < ActiveRecord::Base
  has_paper_trail
  acts_as_mappable :default_units => :kms

  belongs_to :locatable, :polymorphic => true
end


# class Company < ActiveRecord::Base
#   has_one :location, :as => :locatable  # also works for belongs_to associations
#   acts_as_mappable :through => :location
# end
# Then you can still call:

# Company.within(distance, :origin => @somewhere)
# You can also give :through a hash if your location is nested deep. For example, given:

# class House
#   acts_as_mappable
# end

# class Family
#   belongs_to :house
# end

# class Person
#   belongs_to :family
#   acts_as_mappable :through => { :family => :house }
# end

# class Source < ActiveRecord::Base
#   # online groceries OR eating out
#   # name:string 

# x  has_and_belongs_to_many :providers
# x  has_many :categories, through: :providers
# x  has_many :items, through: :providers
#   validates :name, presence: true, uniqueness: true
# end


# class Provider < ActiveRecord::Base
#   # Ocado
#   # name:string website:text
#   has_many :locations, :as => :locatable
#   acts_as_mappable :through => :locations

#  x has_and_belongs_to_many :sources
# x  has_and_belongs_to_many :categories
#  x has_many :items, through: :categories 
#   validates :name, :website, presence: true, uniqueness: true
# end

# class Category < ActiveRecord::Base
#   # vegetables
#   # name:string 
#  x has_and_belongs_to_many :providers
#  x has_many :items
#   validates :name, presence: true, uniqueness: true
# end


# class Item < ActiveRecord::Base
#   # asparagus
#   # name:string link:text tooltip:text cooking_link:text
# x  belongs_to :category
#   delegate :provider, :to => :category, :allow_nil => false
#   delegate :source, :to => :provider, :allow_nil => false
#   acts_as_mappable :through => { :category => {:provider => :location} }
#   validates :name, :link, :category, presence: true
# end

