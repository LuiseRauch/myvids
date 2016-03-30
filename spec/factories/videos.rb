include RandomData

FactoryGirl.define do
  factory :video do
    title RandomData.random_name
    language 'german'
    year 2014
    synopsis RandomData.random_sentence
  end
end
