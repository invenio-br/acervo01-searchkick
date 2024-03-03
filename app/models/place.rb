class Place < ApplicationRecord
  has_many :place_tags, dependent: :destroy
  has_many :tags, through: :place_tags

  validates :name, presence: true
end
