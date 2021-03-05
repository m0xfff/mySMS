class Institute < ActiveRecord::Base
  attr_accessible :name

  has_many :courses
  has_many :notes, as: :noteable

  validates :name, presence: true, length: { maximum: 255 },
            uniqueness: true
end
