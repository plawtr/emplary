class Location < ActiveRecord::Base
  has_paper_trail
  acts_as_mappable :default_units => :kms

  belongs_to :locatable, :polymorphic => true
end
