class Question < ApplicationRecord
	has_many :answers
	has_many :comments
	has_many :votes
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	belongs_to :user
end
