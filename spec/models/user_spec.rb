require 'rails_helper'

RSpec.describe User, type: :model do
  it "should create a user with valid attributes" do
    user = create :valid_user
    expect(user).to be_valid
  end

  it "should not create a user with invalid attributes" do
    user = build :invalid_user
    user.validate

    expect(user).to_not be_valid

    expect(user.errors.any?).to be_truthy
    expect(user.errors.full_messages).to include "Email can't be blank"
    expect(user.errors.full_messages).to include "Password can't be blank"
  end
end
