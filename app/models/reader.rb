class Reader < ActiveRecord::Base
  has_many :check_ins
  has_many :options
  belongs_to :user
  belongs_to :permission
  validates :serial, length: { minimum: 4 }
  validates :desc, length: { minimum: 5 }
end
