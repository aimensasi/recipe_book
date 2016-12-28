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

RSpec.describe Recipe, type: :model do

  let(:valid_attributes) { {:title=>"Good food" }}
  let(:invalid_attributes_without_titile) { {} }

   context "validations" do
    it "has the right columns" do
      should have_db_column(:title).of_type(:string)
      should have_db_column(:description).of_type(:string)
      should have_db_column(:serving).of_type(:string)
      should have_db_column(:preparation_time_hours).of_type(:integer)
      should have_db_column(:preparation_time_minutes).of_type(:integer)
      should have_db_column(:cooking_time_hours).of_type(:integer)
      should have_db_column(:cooking_time_minutes).of_type(:integer)
    end

    describe "Validates Attributes" do
      context "title validations" do
        it { is_expected.to validate_presence_of(:title) }
      end
    end

    describe "Validates Associations" do
      it { should belong_to :user}
      it { should have_many :ingredients}
    end
  end


  describe "can be created when all attributes are present" do
    When(:recipe) { Recipe.create(valid_attributes) }
    Then { recipe.valid? == true }
  end

  describe "cannot be created without a title" do
    When(:recipe) { Recipe.create(invalid_attributes_without_titile) }
    Then { recipe.valid? == false }
  end

end
