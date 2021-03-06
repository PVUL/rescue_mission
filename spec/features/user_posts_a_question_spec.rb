require 'rails_helper'

feature 'user posts a questions', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  # Acceptance Criteria:
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user posts a question' do
    question = FactoryGirl.create(:question)
    visit '/questions'

    click_link 'Ask a question'

    fill_in 'Title', with: question.title
    fill_in 'Body', with: question.body

    click_button 'Submit'

    expect(page).to have_content('Question successfully submitted')
    expect(page).to have_content('Questions')

  end
end
