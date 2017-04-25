class Question < ApplicationRecord
	has_many :answers
	has_many :comments
	has_many :votes
	belongs_to :user
end
