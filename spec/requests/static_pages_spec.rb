require 'spec_helper'

describe "StaticPages" do

  subject { page } # makes page the subject for every test case

  describe "Home page" do
    before { visit root_path } # visit root_path before beginning each test

    it { should have_content('ToiletMaster') }
    it { should have_selector('title',      text: full_title('')) }
    it { should_not have_selector('title',  text: "Home") }
    #it { should have_selector('a', text: "Sign up")}

  end

  describe "Help page" do
    before { visit help_path } # visit help_path before beginning each test

    it { should have_content('Help') }
    it { should have_selector('h1',         text: "Help Center") }
    it { should have_selector('title',      text: full_title("Help")) }

  end

  describe "About page" do
    before { visit about_path } # visit about_path before beginning each test

    it { should have_content('About Us') }
    it { should have_selector('h1',         text: "About Us") }
    it { should have_selector('title',      text: full_title("About Us")) }

  end

  describe "Contact page" do
    before { visit contact_path } # visit contact_path before beginning each test

    it { should have_content('Contact') }
    it { should have_selector('h1',         text: "Contact") }
    it { should have_selector('title',      text: full_title("Contact")) }

  end

end
