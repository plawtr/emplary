require 'rails_helper'
  # has_and_belongs_to_many :providers
  # has_many :items
  # validates :name, presence: true, uniqueness: true


RSpec.describe Category, :type => :model do
 
  let(:online_source) { FactoryGirl.create :source_with_dependents }
  let(:online_source_2) { FactoryGirl.create :source_with_dependents }
  let(:ocado) { FactoryGirl.create :provider_with_dependents}
  let(:veggies) {FactoryGirl.create :category_with_item}
  let(:fruit) {online_source.categories.first}
  let(:location) {FactoryGirl.create :location}
  let(:asparagus) {online_source.items.first}

  it "should have and belong to  many  providers" do
    expect(fruit).not_to be_nil
    expect(fruit.providers.count).to eq 1
    expect(fruit.providers.first.categories).to include fruit
    fruit.providers << ocado
    expect(fruit.providers.count).to eq 2

  end

  it "should have many items" do
    expect(veggies.items.count).to eq 1
    veggies.items << asparagus
    expect(veggies.items.count).to eq 2
  end


end
