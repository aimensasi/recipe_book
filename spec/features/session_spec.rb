require 'rails_helper'

RSpec.describe Session, type: :view do

  describe "the signin process", :type => :feature do
    before :each do
      User.create!(:email => 'user@example.com', :password => '1234567',:first_name=>"Josh",:last_name=>"last_name")
    end

    it "signs me in" do
      visit '/sessions/new'
      # within("#session") do
        fill_in 'Email Address', :with => 'user@example.com'
        fill_in 'Password', :with => '1234567'
      # end
      click_button 'Sign In'
      expect(page).to have_content 'Signed in as:'
    end
  end
end