require 'rails_helper'

RSpec.describe MyUser, type: :request do
    it "gets all users" do
        get my_users_path
        expect(response).to be_successful
    end

    it "get user's show" do
        user = FactoryBot.create(:my_user)
        get my_user_path(user)
        expect(response).to be_successful
    end
end
