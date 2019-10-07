FactoryBot.define do

	FactoryBot.define do

	    factory :user do
		    password {"password"}

        factory :user01, parent: :user do
          email { "user01@gmail.com" }
        end

        factory :user02, parent: :user do
          email { "user02@gmail.com" }
        end

		  end

      factory :tag do
        name {"tag1"}
      end

      factory :tagging do
      end

	    factory :story do
	    	title {"Story title"}
	    	content {"Story content"}

        factory :story01, parent: :story do
        end
        
	    	factory :story02, parent: :story do
		    end

	   end

	end

end