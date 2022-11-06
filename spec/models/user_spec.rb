require "rails_helper"

RSpec.describe User do
  it { is_expected.to have_db_index :auth_token }
  it { is_expected.to have_db_index :email }

  describe "required fields" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to have_secure_password }
  end

  describe "password validation" do
    it { is_expected.to validate_length_of(:password).is_at_least(8).on(:create).with_message("must be at least 8 characters") }
    it { is_expected.not_to allow_values("ABCdef1", "123456798897").for(:password) }
    it { is_expected.to allow_value("ABCd5678").for(:password) }
  end

  describe "with an existing user" do
    before { create(:user, email: "george.smith@example.com") }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.not_to allow_values("george.smith@example.com", "GeorGe.SmiTh@example.com").for(:email) }
  end

  describe "valid email address" do
    it { is_expected.not_to allow_values("me@example", "@example.com", "example.com").for(:email) }
    it { is_expected.to allow_values("me@example.com", "ME@example.COM").for(:email) }
  end

  describe "generates an auth_token on creation" do
    subject(:user) { create(:user) }

    specify { expect(user.auth_token).not_to be_nil }
  end
end
