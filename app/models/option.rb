class Option < ActiveRecord::Base
  has_many :questionnaires
  has_many :responses
end
