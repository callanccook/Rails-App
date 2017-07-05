require 'rails_helper'

describe User do 

	context "is not valid" do 
		it "is not valid without email" do 
			@user = FactoryGirl.build(:user, email: "not_an_email")
			expect(@user).to_not be_valid
		end
	end

end