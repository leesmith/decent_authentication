require 'spec_helper'

describe User do

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  context 'with an existing user' do
    before { Fabricate(:user, email: 'sam.adams@mail.com') }
    it do
      should validate_uniqueness_of :email
      should_not allow_value('Sam.Adams@mail.com').for(:email)
      should_not allow_value('saM.adaMs@mail.com').for(:email)
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
