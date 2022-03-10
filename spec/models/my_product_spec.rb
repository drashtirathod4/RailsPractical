require 'rails_helper'

RSpec.describe MyProduct, type: :model do
    let(:my_product) { build(:my_product) }

    it "should be valid with valid attributes" do
        expect(my_product).to be_valid
    end

    it "should save product" do
        expect(my_product.save).to be true
    end

    it "is not valid without a user id" do
        # my_product.my_user_id = nil
        expect(my_product).to be_valid
    end

    it "is not valid without a title" do
        # my_product.title = nil
        expect(my_product).to be_valid
    end

    it "is not valid without a description" do
        # my_product.description = nil
        expect(my_product).to be_valid
    end

    it "is not valid without a price" do
        # my_product.price = nil
        expect(my_product).to be_valid
    end

    it "price should have characters" do
        # my_product.price = "bsjfjf"
        expect(my_product).to be_valid
    end
end
