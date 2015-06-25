require 'rails_helper'

feature 'user answers a question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do
  # Acceptance Criteria
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  scenario 'user answers a question' do
    question = FactoryGirl.create(:question)
    answer = FactoryGirl.create(:answer)
    visit "/questions/#{question.id}"

    fill_in 'Body', with: answer.body

    click_button 'Submit'

    expect(page).to have_content('Answer successfully submitted')
    expect(page).to have_content('Question Details')

  end
end
