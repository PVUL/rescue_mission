require 'rails_helper'

feature 'user views all questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  # Acceptance Criteria:
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first
  scenario 'views all questions in order by most recent post' do
    question = Question.create!(title:'question 1', body:'this is my question')
    visit '/questions'
    # save_and_open_page
    expect(page).to have_content('question 1')

  end
end
