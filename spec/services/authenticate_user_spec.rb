require 'rails_helper'

RSpec.describe AuthenticateUser do

  subject { AuthenticateUser.new(user, params).call }

  describe 'for unknown user' do
    let(:user) { nil }
    let(:params) { {} }
    it 'is unsuccessful' do
      expect(subject.success?).to be false
    end
  end

  describe 'for known user' do
    let(:user) { Fabricate.build(:user) }

    context 'with correct password' do
      let(:params) { { password: user.password } }
      it 'is successful' do
        expect(subject.success?).to be true
      end
    end

    context 'with incorrect password' do
      let(:params) { { password: 'wrongpassword' } }
      it 'is unsuccessful' do
        expect(subject.success?).to be false
      end
    end
  end
end
