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
    
    it "should get edit" do
        get edit_my_product_path(@product)
        expect(response).to be_successful
    end

    it "should get delete" do
        delete "/my_products/#{@product.id}" 
        expect(MyProduct.find_by(title: "abc")).to be_nil
    end

    it "should get create" do
        product_params = FactoryBot.attributes_for(:my_product)
        post :create, :my_product => product_params
        expect(response).to be_successful
    end
end
