class Category < ActiveRecord::Base
  # vegetables 
  has_and_belongs_to_many :providers
  has_many :items
  validates :name, presence: true, uniqueness: true

end