class ValidVote < ActiveRecord::Base
  belongs_to :constituency
  belongs_to :committee
end
