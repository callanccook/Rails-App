require 'rails_helper'

describe UsersController, type: :controller do
	
	before do
		@user = User.create!(first_name: "Callan", last_name: "Cook", email: "email@email.com", password: "password")
		puts "We made a user!"
		puts @user
		@user2 = User.create!(first_name: "Bentley", last_name: "Sherwood", email: "email2@email.com", password: "password")
		puts "We made a second user!"
		puts @user2
	end 

	describe "GET #show" do 

		context "User is logged in" do
			before do
				puts "We are about to sign in!"
				sign_in @user
				puts "We signed in!"
			end
			it "loads correct user details" do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
		end

		context "No user is logged in" do
			it "redirects to login" do 
				get :show, id: @user.id
				expect(response).to have_http_status(200)
			end
		end
	end

	describe "GET #destroy" do 

		context "User2 is logged in" do
			before do
				sign_in @user2
			end
			it "redirects to login" do 
				get :edit, id: @user.id
				expect(response).to redirect_to root_path
			end
		end 

		context "User2 is logged in" do
			before do
				sign_in @user2
			end
			it "Successfully destroys user2" do
				get :destroy, id: @user2.id
				expect(response).to have_http_status(302)
			end
		end
	end


end