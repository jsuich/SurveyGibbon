class Participant < ActiveRecord::Base
  has_many :participations
  has_many :surveys, :through => :participations
  has_many :answers, :through => :participations
end
