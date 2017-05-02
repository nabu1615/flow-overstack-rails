class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :only => :new

  def index
  	@questions = Question.last(8)
      if params[:query] 
        @questions = Question.where("body LIKE :body OR title LIKE :title", body: "%#{params[:query]}%", title: "%#{params[:query]}%")
      end
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end 

  end

  def show
  	@question = Question.find(params[:id])
  end

  def vote
    @question = Question.find(params[:id])
    case params[:vote]
      when "false"
        @vote = Vote.find_by(voteable_id: params[:id])
        if @vote
          @vote.destroy
          redirect_to question_path(@question)
        else
          @destroy_message = "No existe un voto a eliminar"
          render "questions/show"
        end
      when "true"
        @vote_question = @question.votes.create(user_id: params[:user_id])
        if @vote_question.save
          redirect_to question_path(@question)  
        else
          @vote_errors = @vote_question.errors.full_messages
          render "questions/show"
        end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end 

end
