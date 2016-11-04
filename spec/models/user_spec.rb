require 'rails_helper'

RSpec.describe User do

  it { should have_db_index :auth_token }
  it { should have_db_index :email }

  describe 'required fields' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should have_secure_password }
  end

  describe 'password validation' do
    it { should validate_length_of(:password).is_at_least(8).on(:create).with_message('must be at least 8 characters') }
    it { should_not allow_values('ABCdef1', '123456798897').for(:password) }
    it { should allow_value('ABCd5678').for(:password) }
  end

  describe 'with an existing user' do
    before { create(:user, email: 'george.smith@example.com') }
    specify do
      should validate_uniqueness_of(:email).case_insensitive
      should_not allow_values('george.smith@example.com','GeorGe.SmiTh@example.com').for(:email)
    end
  end

  describe 'valid email address' do
    it { should_not allow_values('me@example','@example.com','example.com').for(:email) }
    it { should allow_values('me@example.com','ME@example.COM').for(:email) }
  end

  describe 'generates an auth_token on creation' do
    subject { create(:user) }
    specify { expect(subject.auth_token).to_not be_nil }
  end

end
