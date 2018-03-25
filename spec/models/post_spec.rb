require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'saves a post with valid input' do
    expect(build(:post)).to be_valid
  end

  it 'does not save a post without a title' do
    expect(build(:invalid_title)).not_to be_valid
  end

  it 'does not save a post without an article' do
    expect(build(:invalid_article)).not_to be_valid
  end
end
