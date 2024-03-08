FactoryBot.define do
  factory :article do
    title { "MyString" }
    description { "MyString" }
    publish_date { "2024-03-07 20:20:01" }
    link { "MyString" }
    author { "MyString" }
    read_status { false }
  end
end
