class Reason < ActiveRecord::Base
  has_many :invalid_votes
end
