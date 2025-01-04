require 'rails_helper'

RSpec.describe User, type: :model do
  it "initial validation" do
    expect(1).to eq(1)
  end

  it "error validation" do
    expect(1).to eq(2)
  end
end
