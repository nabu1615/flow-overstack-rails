class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.new(answer_params)
  	if @answer.save
  		redirect_to question_path(@answer.question)
  	else
  		render 'questions/show'
  	end
  end

  def vote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    case params[:vote]
      when "false"
        @vote = Vote.find_by(voteable_id: params[:id])
        if @vote
          @vote.destroy
          redirect_to question_path(@answer.question)
        else
          @destroy_vote_answer = "No existe un voto a eliminar"
          render "questions/show"
        end
      when "true"
        @vote_answer = @answer.votes.create(user_id: params[:user_id])
        if @vote_answer.save
          redirect_to question_path(@answer.question)  
        else
          @answer_vote_errors = @vote_answer.errors.full_messages
          render "questions/show"
        end
    end
  end

  private

  def answer_params
      params.require(:answer).permit(:body).merge(question_id: params[:question_id])
  end
end
