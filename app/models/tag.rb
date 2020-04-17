class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :album_tags, dependent: :destroy
  has_many :artists, through: :album_tags

  before_save -> { name.downcase! if name.present? }
end
