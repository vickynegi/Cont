class Visitor < ApplicationRecord
	attr_accessor :locale, :visitor_message
	has_many :messages

	validates :email, presence: true, uniqueness: true
	validates :first_name, :last_name, :email, presence: true
end
