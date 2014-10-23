class Source < ActiveRecord::Base
  # online groceries OR eating out

  has_and_belongs_to_many :providers
  has_many :categories, through: :providers
  has_many :items, through: :providers
  validates :name, presence: true, uniqueness: true

end
