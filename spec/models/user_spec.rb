require 'spec_helper'

describe User do

  context "when empty" do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:email_confirmation) }
    it { should_not allow_mass_assignment_of(:password_salt) }
    it { should_not allow_mass_assignment_of(:password_hash) }
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
  end

  context "should not allow invalid email addresses" do
    it "me@mail" do
      User.new(:email => 'me@mail').should have(1).errors_on(:email)
    end
    it "@mail.com" do
      User.new(:email => '@mail.com').should have(1).errors_on(:email)
    end
    it "mail.com" do
      User.new(:email => 'mail.com').should have(1).errors_on(:email)
    end
  end

  context "should allow valid email addresses" do
    it "me@mail.com" do
      User.new(:email => 'me@mail.com').should have(:no).errors_on(:email)
    end
    it "ME@mail.COM" do
      User.new(:email => 'ME@mail.COM').should have(:no).errors_on(:email)
    end
  end

  context "should authenticate valid credentials" do
    before do
      @user = Factory(:user)
    end
    it { User.authenticate(@user.email, @user.password).should be }
  end

  context "should not authenticate invalid credentials" do
    it { User.authenticate("me@mail.com", "password").should be_nil }
  end

end
