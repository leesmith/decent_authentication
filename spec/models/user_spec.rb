require 'spec_helper'

describe User do

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }

  context 'with an existing user' do
    before { Fabricate(:user) }
    it do
      should validate_uniqueness_of :email
    end
  end

  context 'should not allow invalid email address' do
    it { should_not allow_value('me@mail').for(:email) }
    it { should_not allow_value('@mail.com').for(:email) }
    it { should_not allow_value('mail.com').for(:email) }
  end

  context 'should allow valid email addresses' do
    it { should allow_value('me@mail.com').for(:email) }
    it { should allow_value('ME@mail.COM').for(:email) }
  end

end
