include RandomData

FactoryGirl.define do
  factory :series do
    title RandomData.random_name
    synopsis RandomData.random_sentence
  end
end
