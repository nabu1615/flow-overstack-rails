class Question < ApplicationRecord
	has_many :answers
	has_many :comments
	has_many :comments, as: :commentable
	has_many :votes, as: :voteable
	belongs_to :user

	validates :title, :body, presence: true
end