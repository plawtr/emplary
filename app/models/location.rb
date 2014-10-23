class Location < ActiveRecord::Base
  has_paper_trail
  acts_as_mappable :default_units => :kms

  belongs_to :locatable, :polymorphic => true
  has_one :sw_suggested_bound
  has_one :ne_suggested_bound
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

class Source 
  # online groceries OR eating out
  # name:string 
  has_many :providers
  has_many :categories, through: :providers
  has_many :items, through: :providers

end


class Provider
  # Ocado
  # name:string
  has_one :location, :as => :locatable
  acts_as_mappable :through => :location

  has_and_belongs_to_many :categories
  has_many :items, through: :categories 

end

class Category
  # vegetables
  # name:string 
  has_and_belongs_to_many :providers
  has_many :items
end


class Item
  # asparagus
  # name:string link:text tooltip:text cooking_link:text
  belongs_to :category
  delegate :provider, :to => :category, :allow_nil => false
  delegate :source, :to => :provider, :allow_nil => false
  acts_as_mappable :through => { :category => :provider }
end

