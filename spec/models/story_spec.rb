require 'rails_helper'

RSpec.describe Story, type: :model do

  let (:user01 ) { create(:user01) } 
  let (:tag) { create(:tag) }
	let (:story01) { create(:story01, user: user01, tags: [tag]) }
  let (:tagging) { create(:tagging, tag_id: tag.id, story_id: story01.id) }

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
				@stories = Story.user_stories(story01.user)
				expect(@stories.first.user.id).to eq(story01.user.id)
			end
		end

		describe ".tagged_with scope" do
			it "returns stories tagged with passed tag" do
        @story01 = story01
        @tagging = tagging
        @stories_with_tag = Story.tagged_with(tag.id)
        expect(@stories_with_tag.first.id).to eq(@story01.id)
			end
		end
	end

end
