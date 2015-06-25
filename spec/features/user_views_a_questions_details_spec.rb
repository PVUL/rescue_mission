require 'rails_helper'

feature 'user views a questions details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  # Acceptance Criteria:
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description
  # scenario 'views question details including title and description' do
  #   question = Question.create!(title:'question 2', body:'this is my question 2')
  #   visit '/questions'
  # 
  #   click_link 'question 2'
  #
  #   expect(page).to have_content('question 2')
  #   expect(page).to have_content('this is my question 2')
  # end
end
