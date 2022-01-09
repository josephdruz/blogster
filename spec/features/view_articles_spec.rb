require 'rails_helper'

RSpec.feature "ViewArticles", type: :feature, js: true do
  before :each do
    Article.create!(
      title: 'Test Article',
      body: 'The content of the test article.'
    )
  end

  scenario "Visit the first article" do
    visit '/'

    expect(page).to have_content 'articles'
    expect(page).to have_content 'Test Article'

    click_link 'Test Article'

    expect(page).to have_content 'Test Article'
    expect(page).to have_content 'The content of the test article.'
  end
end
