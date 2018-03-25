require 'rails_helper'

RSpec.describe Post, type: :model do
  describe('Validations') do
    let(:user) {User.new(username: 'johndoe', email: 'johndoe@example.com')}
    subject {
      described_class.new(title: 'My Post', article: 'My first post', user: user)
    }

    it 'saves a post with valid input' do
      expect(subject).to be_valid
    end

    it 'does not save a post without a title' do
      expect(build(:invalid_title)).not_to be_valid
    end

    it 'does not save a post without an article' do
      expect(build(:invalid_article)).not_to be_valid
    end
  end

  describe('Associations') do
    it { should belong_to(:user) }
  end
end
