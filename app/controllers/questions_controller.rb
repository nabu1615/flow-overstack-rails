class QuestionsController < ApplicationController
  def index
  	@questions = Question.last(8)
  end

  def new
  	@question = Question.new
  end

  def create
  	#@question = Question.create
  end

  def show
  	@question = Question.find(params[:id])
  end
end
