require 'rails_helper'

RSpec.describe MyProduct, type: :request do
    before do
        @user = FactoryBot.create(:my_user)
        @user.save
        sign_in @user

        @product = @user.my_products.create(title: "abc", description: "abc desc", price: "600")
        @product.save
    end

    it "gets all products" do
        get my_products_path
        expect(response).to be_successful
    end

    it "should get show" do
        get my_product_path(@product)
        expect(response).to be_successful
        puts "#{@user.name} - #{@product.title}"
    end

    it "should get new" do
        get new_my_product_path
        expect(response).to be_successful
    end

    it "should get create" do
        expect do
            post '/my_products', params: { my_product: { title: "abcd", description: "abc desc", price: "600", my_user_id: @user.id } }
        end.to change(MyProduct, :count).by(1)
        expect(response).to have_http_status(:redirect)
    end
    
    it "should get edit" do
        get edit_my_product_path(@product)
        expect(response).to be_successful
    end

    it 'should update the product' do
        patch "/my_products/#{@product.id}", params: {my_product: {title: "Updated title"} }
        expect(MyProduct.find_by_title("Updated title")).to eq(@product)
        puts MyProduct.where(title: "Updated title").pluck(:title)
    end

    it "should get delete" do
        delete "/my_products/#{@product.id}"
        expect(MyProduct.find_by(title: "abc")).to be_nil
    end
end
