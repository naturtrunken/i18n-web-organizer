FactoryGirl.define do

 factory :project do |p|
  sequence(:name) { |n| "Test project #{n}" }
  default_language 'de'
 end

end
