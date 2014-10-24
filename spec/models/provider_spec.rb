require 'rails_helper'


RSpec.describe Provider, :type => :model do
 
  let(:online_source) { FactoryGirl.create :source_with_dependents }
  let(:online_source_2) { FactoryGirl.create :source_with_dependents }
  let(:ocado) { FactoryGirl.create :provider_with_dependents}
  let(:veggies) {FactoryGirl.create :category_with_item}
  let(:location) {FactoryGirl.create :location}
  let(:asparagus) {online_source.items.first}

  it "should belong to a category and provider" do
    expect(asparagus).not_to be_nil
    expect(asparagus.category).to eq online_source.categories.first
    expect(asparagus.provider).to eq online_source.providers.first
  end

  it "should belong to sources via provider" do
    expect(asparagus.sources).to include online_source
  end

  it "should have and be able to increment locations via provider" do
    expect(asparagus.locations.count).to eq 1
    asparagus.provider.locations << location
    expect(asparagus.locations.count).to eq 2
  end

end
