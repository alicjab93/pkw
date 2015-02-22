class Committee < ActiveRecord::Base
  has_and_belongs_to_many :provinces
#  has_many :constituencies, through: :provinces
  has_many :valid_votes#, through: :constituencies
end
