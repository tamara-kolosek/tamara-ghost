require 'rails_helper'

RSpec.describe Story, type: :model do

	let (:story) { create(:story_with_user) }

	context "Attributes" do
		it { should have_db_column(:title).of_type(:string) }
		it { should have_db_column(:last_edit).of_type(:datetime) }
		it { should have_db_column(:part_of_the_content).of_type(:string) }
		it { should have_db_column(:content).of_type(:string) }
		it { should have_db_column(:user_id).of_type(:integer) }
	end

	context "Associations" do
		it { should belong_to(:user) }
	end

	context "Validations" do 
		it { should validate_presence_of(:title)}
	end

	context "Methods" do

		before(:all) do
		end

		describe ".user_stories scope" do
			it "returns stories of passed user" do
				@stories = Story.user_stories(story.user)
				expect(@stories.first.user.id).to eq(story.user.id)
			end
		end
	end

end
