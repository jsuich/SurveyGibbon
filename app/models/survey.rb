class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :participations
  has_many :questions
  has_many :answers, :through => :questions
  has_many :participants, :through => :participations #need to double-check this
end
