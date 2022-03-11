FactoryBot.define do
    factory :my_user do
        name { Faker::Name.unique.name }
        email { Faker::Internet.unique.email }
        password  { Faker::Internet.unique.password }
        role { "Admin" }
        phone { Faker::PhoneNumber.cell_phone }
    end
end 
