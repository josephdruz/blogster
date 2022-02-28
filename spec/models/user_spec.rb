require 'rails_helper'

RSpec.describe User, type: :model do
  it "should create a user with valid attributes" do
    user = create :valid_user
    expect(user).to be_valid
  end

  it "should not create a user with invalid attributes" do
    user = create :invalid_user
    expect(user).to.not be_valid
  end
end
