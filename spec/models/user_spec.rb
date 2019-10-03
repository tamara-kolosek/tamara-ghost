require 'rails_helper'

RSpec.describe User, type: :model do

	let (:user) { create(:user) }

	context "Attributes" do
		it { should have_db_column(:email).of_type(:string) }
		it { should have_db_column(:encrypted_password).of_type(:string) }
		it { should have_db_column(:reset_password_token).of_type(:string) }
		it { should have_db_column(:remember_created_at).of_type(:datetime) }
		it { should have_db_column(:role).of_type(:integer) }
		it { should have_db_column(:id).of_type(:integer) }
		it { should have_db_column(:slug).of_type(:string) }
		it { should have_db_column(:full_name).of_type(:string) }
		it { should have_db_column(:bio).of_type(:string) }
		it { should have_db_column(:image_url).of_type(:string) }
		it { should have_db_column(:last_login).of_type(:datetime) }
	end

	context "Associations" do
		it { should have_many(:storys).class_name("Story")}
		it { should have_many(:invitations).class_name("User")}
	end

	context "Validations" do 
		it { should validate_presence_of(:email)}
	end

	context "Methods" do
  
		describe "is_admin" do
			it "tests if user has role 'admin'" do
		  		user.role = 2
		  	    expect(user.is_admin).to eql(true)
		  	end

		  	it "tests if user has role 'admin'" do
		  		user.role = 1
		  	    expect(user.is_admin).to eql(false)
		  	end
		end

		describe ".is_editor" do
			it "tests if user has role 'is_editor'" do
		  		user.role = 1
		  	    expect(user.is_editor).to eql(true)
		  	end

		  	it "tests if user has role 'is_editor'" do
		  		user.role = 2
		  	    expect(user.is_editor).to eql(false)
		  	end
		end
	end

    it "is not valid without email" do
  		expect(User.new(id: 1, password: 'password')).to_not be_valid
    end

    it "is not valid without password" do
  		expect(User.new(id: 1, email: 'user@email.com')).to_not be_valid
    end

end
