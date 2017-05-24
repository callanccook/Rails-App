require 'rails_helper'

describe Comment do

	context "is not valid" do
		
		it "is not valid without a rating" do
			expect(Comment.new(body: "Good cake")).not_to be_valid
		end
	end
	
end