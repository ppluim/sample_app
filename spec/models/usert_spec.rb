# == Schema Information
#
# Table name: userts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Usert do
  before do
    @usert = Usert.new(name: 'Pieter', email: 'pieter@pluim.nl', password: 'foobarism', password_confirmation: 'foobarism' )
  end

  subject { @usert }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe 'when name is not present' do
    before { @usert.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when email is not present' do
    before { @usert.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when name is too long' do
    before { @usert.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe 'when email is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @usert.email = invalid_address
        @usert.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @usert.email = valid_address
        @usert.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @usert.dup
      user_with_same_email.email = @usert.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe 'when password is not present' do
    before { @usert.password = @usert.password_confirmation = ' ' }

    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @usert.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @usert.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @usert.save }
    let(:found_user) { Usert.find_by_email(@usert.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@usert.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "with a password that's too short" do
    before { @usert.password = @usert.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

end
