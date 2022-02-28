FactoryBot.define do
  factory :article do
    factory :valid_article do
      title { "header" }
      body { "content" }
    end
    factory :invalid_article do
      title { "" }
      body { "" }
    end
  end
end
