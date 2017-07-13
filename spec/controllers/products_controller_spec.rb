require 'rails_helper'

describe ProductsController, type: :controller do
	
	describe 'GET #index' do
		context 'search without without params[:q]' do
			it 'populates an array with all the product' do
				chocolate = Product.create!( name: "chocolate")
        vanilla = Product.create!( name: "vanilla")
        get :index
        expect(assigns(:products)).to match_array([chocolate, vanilla])
			end
		end

    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
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

		it "assigns the requested product to @product" do
      get :edit, params: {id: @product}
      expect(assigns(:product)).to eq @product
    end

		it 'renders the edit product page' do
			get :edit, params: {:id => @product}
			expect(response).to be_success
		end
	end

	describe 'DELETE #destroy' do
		before do 
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.build(:admin)
			sign_in @user
		end

		it 'allows admin to delete a product' do
			expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
		end
	end
	
	describe 'POST #create' do
		it 'does not create invalid product' do
			@product = FactoryGirl.build(:product, :name => '')
			expect(@product).not_to be_valid
		end
	end

	describe 'PATCH #update' do
		before do
			@product = FactoryGirl.create(:product, :name => "chocolate")
			@user = FactoryGirl.build(:admin)
			sign_in @user
		end
		it 'updates a product' do
      patch :update, id: @product, product: { name: "vanilla"}
    	assert_redirected_to product_path(assigns(:product))
		end
	end	


end

  