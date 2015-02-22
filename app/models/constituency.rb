class Constituency < ActiveRecord::Base
  belongs_to :province
  has_one :user
  has_many :committees, through: :province
  has_many :valid_votes
  has_many :invalid_votes
  accepts_nested_attributes_for :valid_votes
  accepts_nested_attributes_for :invalid_votes #, allow_destroy: true, reject_if: proc { |invalid_vote| invalid_vote[:name].blank? }
  validates_uniqueness_of :number, :scope => :province_id
end
