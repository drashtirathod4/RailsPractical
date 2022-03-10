FactoryBot.define do
    factory :my_product do
        title { "Product 1" }
        description { "Product 1 Description" }
        price  { 1000 }
        my_user_id { FactoryBot.create(:my_user).id }
    end
end 
