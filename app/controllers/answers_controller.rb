class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find_by(id: params[:question_id])
  end

  def index
    @answers = Answer
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find_by(id: params[:question_id])
    @answer.question = @question
    @answers = @question.answers

    if @answer.save
      flash[:notice] = 'Answer successfully submitted.'
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(". ")
      render 'questions/show'
    end
  end

  def show
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
    @answer.update(answer_params)
    @answers = @question.answers

    if @answer.save
      flash[:notice] = 'Answer successfully editted.'
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(". ")
      render :show
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question

    if @answer.destroy
      flash[:notice] = 'Question has been deleted.'
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  protected

  def answer_params
    params.require(:answer).permit(:body)
  end
end
