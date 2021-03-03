class Institute < ActiveRecord::Base
  attr_accessible :name

  has_many :courses

  validates :name, presence: true, length: { maximum: 255 },
            uniqueness: true
end
