class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable,   
  devise :database_authenticatable, :trackable, :validatable
  belongs_to :constituency
end
