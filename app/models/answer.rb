class Answer < ActiveRecord::Base
  belongs_to :participation
  belongs_to :question
  belongs_to :option
end
