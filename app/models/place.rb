class Place < ApplicationRecord
  has_many :place_tags, dependent: :destroy
  has_many :tags, through: :place_tags

  validates :name, presence: true
  scope :search_import, -> { includes(:tags) }

  searchkick

  def search_data
    {
      name: name,
      description: description,
      address: address,
      active: active,
      tags: tags.map(&:name).join(' ')
    }
  end
end
