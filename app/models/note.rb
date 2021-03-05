class Note < ActiveRecord::Base
  attr_accessible :title, :content, :noteable_id, :noteable_type

  belongs_to :noteable, polymorphic: true

  validates :title, presence: true
  validates :content, presence: true
  validates :noteable, presence: true

  validates :noteable_type, inclusion: %w[Student Course Institute]
end
