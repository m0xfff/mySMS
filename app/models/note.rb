class Note < ActiveRecord::Base
  attr_accessible :title, :content, :entity_id, :entity_type

  belongs_to :entity, polymorphic: true

  validates :title, presence: true
  validates :content, presence: true
end
