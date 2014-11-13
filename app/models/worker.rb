class Worker < ActiveRecord::Base
  has_many :check_ins
  validates :username, length: { minimum: 5 }
  validates :card, length: { minimum: 4 }
end
