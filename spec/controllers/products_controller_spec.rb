require 'rails_helper'

describe ProductsController, type: :controller do
	
	describe 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index page' do
      expect(response).to render_template('index')
    end
  end

	describe 'GET #show' do
		before do
			@product = FactoryGirl.create(:product)
		end

		it 'renders a product show page' do
			expect(get :show, params: {:id => @product} ).to be_success
		end 
	end

	describe 'GET #edit' do
		before do 
			@product = FactoryGirl.create(:product)
		end

		it 'renders the edit product page' do
			expect(response).to be_success
		end
	end

	describe 'DELETE #destroy' do
		before do 
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.create(:admin)
			sign_in @user
		end

		it 'allows admin to delete a product' do
			expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
		end
	end


end

  