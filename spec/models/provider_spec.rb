require 'rails_helper'


  # has_many :locations, :as => :locatable
  # acts_as_mappable :through => :locations

  # has_and_belongs_to_many :sources
  # has_and_belongs_to_many :categories
  # has_many :items, through: :categories 
  # validates :name, :website, presence: true, uniqueness: true

RSpec.describe Provider, :type => :model do
 
  let(:online_source) { FactoryGirl.create :source_with_dependents }
  let(:online_source_2) { FactoryGirl.create :source_with_dependents }
  let(:ocado) { FactoryGirl.create :provider_with_dependents}
  let(:veggies) {FactoryGirl.create :category_with_item}
  let(:location) {FactoryGirl.create :location}


  it "should be able to create the provider" do
    expect(ocado).not_to be_nil
    expect(ocado.categories.count).to eq 1
  end

  it "should have locations" do
    expect(ocado.locations.count).to eq 1
    ocado.locations << location
    expect(ocado.locations.count).to eq 2
  end

  it "should have and belong to many sources" do
    online_source.providers << ocado
    online_source_2.providers << ocado
    expect(online_source_2.providers.count).to eq 2
    expect(online_source.providers.count).to eq 2
    expect(ocado.sources.count).to eq 2
  end 

  it "should have and belong to many categories" do
    ocado.categories << veggies
    expect(ocado.categories.count).to eq 2
    expect(veggies.providers.count).to eq 1
  end 

  it "should have many items, which increment if categories get assigned to it" do
    expect(ocado.items.count).to eq 1
    ocado.categories << veggies
    expect(ocado.items.count).to eq 2
  end

end
