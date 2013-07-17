require 'spec_helper'

describe "Usert pages" do

  describe "signup page" do
    subject { page }
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a usert" do
        expect { click_button submit }.not_to change(Usert, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Usert"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a usert" do
        expect { click_button submit }.to change(Usert, :count).by(1)
      end
    end

  end

  describe "profile page" do
    # Code to make a user variable
    usert = let(:usert) { FactoryGirl.create(:usert) }

    before { visit usert_path(usert) }

    it { should have_selector('h1',    text: usert.name) }
    it { should have_selector('title', text: usert.name) }
  end
end
