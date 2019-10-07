require 'rails_helper'

RSpec.describe Tag, type: :model do

  context "Attributes" do
  	it { should have_db_column(:name).of_type(:string)}
  end

  context "Associations" do
    it { should have_many(:taggings).class_name("Tagging") }
    it { should have_many(:stories).through("taggings")}
  end

end
