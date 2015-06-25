class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question successfully submitted.'
      redirect_to questions_path
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
    @answers = @question.answers
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    @question.update(question_params)

    if @question.save
      flash[:notice] = 'Question successfully editted.'
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])

    if @question.destroy
      flash[:notice] = 'Question has been deleted.'
      redirect_to questions_path
    else
      render :new
    end
  end

  protected

  def question_params
    params.require(:question).permit(:title, :body)
  end

end
