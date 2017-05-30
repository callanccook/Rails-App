FactoryGirl.define do 
	#sequence used for product names
	sequence(:name) { |n| "name#{n}"}

	factory :product do
		name 
		description "colorful"
	end

end