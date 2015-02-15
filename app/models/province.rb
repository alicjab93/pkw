class Province < ActiveRecord::Base
  has_and_belongs_to_many :committees
  has_many :valid_votes, through: :constituencies
  has_many :invalid_votes, through: :constituencies
  has_many :constituencies
end
