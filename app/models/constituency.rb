class Constituency < ActiveRecord::Base
  belongs_to :province
  has_one :user
  has_many :committees, through: :province
end
