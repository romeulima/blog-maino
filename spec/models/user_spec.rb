require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "name should be present" do
      user = build(:user, name: "")
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("não pode ficar em branco")
    end

    it "email should be present" do
      user = build(:user, email: "")
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("não pode ficar em branco")
    end

    it "username should be present" do
      user = build(:user, username: "")
      expect(user).to_not be_valid
      expect(user.errors[:username]).to include("não pode ficar em branco")
    end

    it "email should be valid when correctly formatted" do
      user = build(:user, email: "test@example.com")
      expect(user).to be_valid
    end

    it "email should be invalid when incorrectly formatted" do
      user = build(:user, email: "invalid_email")
      expect(user).to_not be_valid
    end
  end
end
