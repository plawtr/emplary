require 'rails_helper'

  # has_and_belongs_to_many :providers
  # has_many :categories, through: :providers
  # has_many :items, through: :providers
  # validates :name, presence: true, uniqueness: true

RSpec.describe Source, :type => :model do
  
  let(:online_source) { FactoryGirl.create :source_with_dependents }
  let(:ocado) { FactoryGirl.create :provider_with_dependents}
  let(:veggies) {FactoryGirl.create :category_with_item}



  it "should be able to create the source with one provider" do
    expect(online_source).not_to be_nil
    expect(online_source.providers.count).to eq 1
  end

  it "should be able to increment providers" do
    online_source.providers << ocado
    expect(online_source.providers.count).to eq 2
  end

  it "should be able to access provider location" do
    expect(online_source.providers.first.locations.count).to eq 1
  end

  it "should be able to access categories through providers" do
    provider = online_source.providers.first
    expect(provider.categories.count).to eq 1
  end

  it "should be able to access categories directly" do
    expect(online_source.categories.count).to eq 1
  end

  it "should be able to increment categories" do
    provider = online_source.providers.first
    provider.categories << veggies
    expect(provider.categories.count).to eq 2
  end

  it "should be able to access items via provider and categories" do
    category = online_source.providers.first.categories.first
    expect(category.items).not_to be_nil
    expect(category.items.count).to eq 1
  end

  it "should be able to access items directly" do
    expect(online_source.items).not_to be_nil
    expect(online_source.items.count).to eq 1
  end

  it "should be able to access providers" do
    expect(online_source.providers.count).to eq 1
  end
end

