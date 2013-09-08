class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  has_many :questionnaires
  has_many :options, :through => :questionnaires
end
