require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'ToiletMaster'" do
      visit root_path
      page.should have_content('ToiletMaster')
    end

    it "'s title should contain the word 'ToiletMaster'" do
      visit root_path
      page.should have_selector('title',
                                :text => "ToiletMaster")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help Center'" do
      visit help_path
      page.should have_selector('h1', text: "Help Center")
    end

    it "should have the content 'Help'" do
      visit help_path
      page.should have_content('Help')
    end

    it "'s title should contain the word 'Help'" do
      visit help_path
      page.should have_selector('title',
                                text: "Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit about_path
      page.should have_selector('h1', text: "About Us")
    end

    it "should have the content 'About Us'" do
      visit about_path
      page.should have_content('About Us')
    end

    it "'s title should contain the word 'About'" do
      visit about_path
      page.should have_selector('title',
                                :text => "About")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: "Contact")
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', text: "Contact")
    end
  end
end
