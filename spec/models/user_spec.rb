# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_attributes) { {:email => "adam@gmail.com", :password => "12234567", :role => "individual"} }
  let(:invalid_attributes) { {:email => "adam@gmail.com", :password => "1567", :role => "individual"} }


   context "validations" do
    it "has the right columns" do
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:role).of_type(:string)
    end

    describe "Validates Attributes" do
      context "email validations" do
        it { is_expected.to validate_presence_of(:email) }
        it { is_expected.to validate_uniqueness_of(:email) }
        it { should allow_value('user@example.com').for(:email) }
        it { is_expected.not_to allow_value('userexample.com').for(:email) }
      end
      context "password validations" do
        it { is_expected.to validate_presence_of(:password) }
        it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
      end
      context "Role validations" do
        it { is_expected.to validate_presence_of(:role) }
        it { is_expected.to validate_inclusion_of(:role).in_array(['school', 'individual']) }
      end
    end

    describe "Validates Associations" do
      it { should have_one(:school) }
      it { should have_one(:individual) }
    end
  end


  describe "can be created when all attributes are present" do
    When(:user) { User.create(valid_attributes) }
    Then { user.valid? == true }
  end

  describe "cannot be created without a first_name" do
    When(:user) { User.create(invalid_attributes) }
    Then { user.valid? == false }
  end
end
