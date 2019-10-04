FactoryBot.define do

	FactoryBot.define do

	    factory :user do
		    email {"example@gmail.com"}
		    password {"password"}
		end

	    factory :story do
	    	title {"Story title"}
	    	content {"Story content"}

	    	trait :with_user do
				association :user
		    end

		    factory :story_with_user, traits: [:with_user]
	   end

	end

end