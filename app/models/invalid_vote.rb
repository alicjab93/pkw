class InvalidVote < ActiveRecord::Base
  belongs_to :constituency
  belongs_to :reason
end
