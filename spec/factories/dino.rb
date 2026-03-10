FactoryBot.define do
    factory :dino do
        name { "Rex" }
        age { 10 }
        category { :herbivore }
        period { :Cretaceous }
        diet { :plants }
    end
end
