class MediaFile < ApplicationRecord

  validates_presence_of :name, :file_path

  def full_path
    "#{file_path}#{file_name}"
  end

  def file_name
    name.tr(' ', '-').downcase
  end
end
