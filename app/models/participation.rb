class Participation < ActiveRecord::Base
  belongs_to :participant
  belongs_to :survey
end
