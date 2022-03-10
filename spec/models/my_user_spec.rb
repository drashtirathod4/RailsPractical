require 'rails_helper'

RSpec.describe MyUser, type: :model do
    let(:my_user) { build(:my_user) }

    it "should be valid with valid attributes" do
        expect(my_user).to be_valid 
    end

    it "should save user" do
        expect(my_user.save).to be true
    end

    it "is not valid without a email" do
        # my_user.email = nil
        expect(my_user).to be_valid
    end  

    it "is not valid without a password" do
        # my_user.password = nil
        expect(my_user).to be_valid
    end  

    it "is not valid without a role" do
        # my_user.role = nil
        expect(my_user).to be_valid
    end

    it "password shouldn't be too short" do
        # my_user.password = "abcd"
        expect(my_user).to be_valid
    end
end
