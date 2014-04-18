require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do

    let(:base_title) { "HomePage" }

    describe "Home Page" do
      it "Home Page found" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get static_pages_home_path
        response.status.should be(200)
      end

      it "Home Page has Title" do
        visit '/static_pages/home'
        expect(page).to have_title("#{base_title}")
      end

      it "should not have a custom page title" do
        visit '/static_pages/home'
        expect(page).not_to have_title('| Home')
      end
    end

    describe "Help Page" do
      it "Help Page Found" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get static_pages_help_path
        response.status.should be(200)
      end

      it "Help Page has Title" do
        visit '/static_pages/help'
        expect(page).to have_title("#{base_title} | Help")
      end
    end

    describe "Contact Page" do
      it "ContactPate Found" do
        get static_pages_contact_path
        response.status.should be(200)
      end

      it "ContactPage has Title" do
        visit '/static_pages/contact'
        expect(page).to have_title("#{base_title} | Contact")
      end
    end

    describe "About page" do
      it "Aboud Page Found" do
        get static_pages_about_path
        response.status.should be(200)
      end

      it "About Page has Title" do
        visit '/static_pages/about'
        expect(page).to have_title("#{base_title} | About")
      end
    end
  end
end
