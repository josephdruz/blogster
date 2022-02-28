require 'rails_helper'

RSpec.describe Article, type: :model do
  it "should create an article with valid attributes" do
    article = create :valid_article
    expect(article).to be_valid
  end

  it "should not create a user with invalid attributes" do
    article = build :invalid_article
    article.validate

    expect(article).to_not be_valid

    expect(article.errors.any?).to be_truthy
    expect(article.errors.full_messages).to include "Title can't be blank"
  end
end
