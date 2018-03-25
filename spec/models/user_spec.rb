require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves a user with valid input' do
      expect(build(:user)).to be_valid
    end

    it 'does not save a user without a username' do
      expect(build(:invalid_username)).not_to be_valid
    end

    it 'does not save a user without an email address' do
      expect(build(:invalid_email)).not_to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts)}
  end
end
