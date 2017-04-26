class QuestionsController < ApplicationController
  def index
  	@questions = Question.last(8)
  end

  def new
  end

  def create
  end

  def show
  end
end
