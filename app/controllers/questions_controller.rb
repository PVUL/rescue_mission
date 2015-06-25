class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question successfully submitted.'
      redirect_to '/questions'
    else
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @question = Question.find_by(id: params[:id])

  end

  protected

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
