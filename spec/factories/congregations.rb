FactoryGirl.define do
  factory :congregation do
    name "Anytown"
    number "12345"
    meeting_time "10:00 AM"
    meeting_day "Sunday"
    address "1234 Main St."
    kh_phone '123-456-7789'
    talk_coordinator 'John Doe'
    talk_coordinator_phone '123-475-5729'
  end
end
