# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do

  it "is valid" do
    post = build(:post)
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = build(:post, title: "")
    expect(post).to be_invalid
  end

  it "is invalid with too short content" do
    post = build(:post, content: "real short")
    expect(post).to be_invalid
  end

  it "is invalid with a long summary" do
    post = build(:post, summary: ("hello" * 100))
    expect(post).to be_invalid
  end

  it "is invalid with a category outside the choices" do
    post = build(:post, category: "Bowling Ball")
    expect(post).to be_invalid
  end

  it "is invalid if not clickbait" do
    post = build(:post, title: "True Facts")
    expect(post).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end
end
