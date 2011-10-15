require 'spec_helper'

describe User do

  context 'creation' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_presence_of :password_digest }
  end
end
