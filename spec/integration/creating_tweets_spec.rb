require 'spec_helper'

feature "creating tweets" do
  before do
    visit '/'
  end

  scenario "creating a tweet" do
    click_link "New Tweet"
    fill_in "Body", :with => "Here is a new tweet!"
    click_button "Create Tweet"
    page.should have_content("You created a new Tweet.")
  end
end
