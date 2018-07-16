require 'rails_helper'

RSpec.describe Author, type: :model do
  it "is valid" do
    author = build(:author)
    expect(author).to be_valid
  end

  it "is invalid with no name" do
    author = build(:author, name: "")
    expect(author).to be_invalid
  end

  it "is invalid with a short number" do
    author = build(:author, name: "Caligula", phone_number: 555305442)
    expect(author).to be_invalid
  end

  it "is invalid when non-unique" do
    create(:author, name: "Caligula", phone_number: 5557890001)
    author = build(:author, name: "Caligula", phone_number: 5557890001)
    expect(author).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:author)).to be_valid
  end
end
