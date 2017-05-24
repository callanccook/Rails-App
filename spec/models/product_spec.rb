require 'rails_helper'

describe Product do

	before do 
		@product = Product.create!(name: "birthday cake")
		@user = User.create!(first_name: "Meredith", last_name: "Candler", email: "callanccook@gmail.com", password: "password")
		@product.comments.create!(rating: 1, user: @user, body: "Awful cake!")
		@product.comments.create!(rating: 3, user: @user, body: "Okay cake!")
		@product.comments.create!(rating: 5, user: @user, body: "Great cake!")
	end

	context "when the product has comments" do
	
		it "returns an average rating of all comments" do 
			expect(@product.average_rating).to eq 3
		end
	end

	context "is not valid" do

		it "will not be valid when not given a name" do 
			expect(Product.new(description: "Good cake")).not_to be_valid
		end
	end

end