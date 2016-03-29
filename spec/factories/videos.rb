include RandomData

FactoryGirl.define do
  factory :video do
    title RandomData.random_name
    language 1
    year 1
    synopsis RandomData.random_sentence
  end
end
