require 'rails_helper'

describe User do 

	#before do 
		#@user = User.create!(first_name: "Meredith", last_name: "Candler", email: "callanccook@gmail.com", password: "password")
	#end

	context "is not valid" do 

		it "is not valid without email" do 
			# expect(User.new(first_name: "Callan", last_name: "Cook", password: "password")).not_to be_valid
			@user = FactoryGirl.build(:user, email: "not_an_email")
			expect(@user).to_not be_valid
		end
	end

end