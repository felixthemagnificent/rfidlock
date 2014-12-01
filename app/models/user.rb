class User < ActiveRecord::Base
  has_many :check_ins
  has_many :permissions
  has_many :readers
  has_many :workers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
