class MediaFile < ApplicationRecord
  belongs_to :media_type
  has_many :media_file_categories
  has_many :media_categories, through: :media_file_categories

  validates_presence_of :name, :file_path, :media_type_id

  def full_path
    "#{file_path}#{file_name}"
  end

  def file_name
    name.tr(' ', '-').downcase
  end
end
