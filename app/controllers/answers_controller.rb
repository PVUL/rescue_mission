class AnswersController < ApplicationController
  def new
    @question = Question.new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find_by(id: params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer successfully submitted.'
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def index
    @answers = Answer.all
  end

  protected

  def answer_params
    params.require(:answer).permit(:body)
  end

end
