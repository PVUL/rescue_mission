class AnswersController < ApplicationController
  def new
  end

  def index
    @answers = Answer.all
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find_by(id: params[:question_id])
    @answer.question = @question #associates to the id of the question

    if @answer.save
      flash[:notice] = 'Answer successfully submitted.'
      redirect_to question_path(@question)
    else
      render :new
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

    if @answer.save
      flash[:notice] = 'Answer successfully editted.'
      redirect_to question_path(@question)
    else
      render :new
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
