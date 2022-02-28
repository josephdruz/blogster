require "rails_helper"

RSpec.feature "Create Users", type: :feature, js: true do
  scenario "user can register an account using email and password" do
    visit "/register"

    expect(page).to have_content /Register/i

    expect(page).to have_field "Email", type: "email", with: ""
    expect(page).to have_field "Password", type: "password", with: ""
    expect(page).to have_field "Password confirmation", type: "password", with: ""

    expect(page).to have_button "Register"

    within "form" do
      fill_in "Email", with: "test@user.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button
    end

    expect(page).to have_current_path(articles_path)
  end
end
