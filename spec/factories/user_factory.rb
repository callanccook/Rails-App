FactoryGirl.define do
	# Using a sequence so I don't have to come up with another email address
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email 
		password "password"
		first_name "Jane"
		last_name "Eyre"
		admin false
	end

	factory :admin, class: User do
		email
		password "password"
		first_name "Meredith"
		last_name "Candler"
		admin true
	end

end