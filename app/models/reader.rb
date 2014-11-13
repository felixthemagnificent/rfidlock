class Reader < ActiveRecord::Base
  has_many :check_ins
  validates :serial, length: { minimum: 4 }
  validates :desc, length: { minimum: 5 }
end
