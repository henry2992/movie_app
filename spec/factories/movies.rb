FactoryGirl.define do
  factory :movie do
    title "Start Wars"
    studio "Lucas Film"
    date Date.today
    price 11.50
    rating 10
    genre "Action"
  end
end
