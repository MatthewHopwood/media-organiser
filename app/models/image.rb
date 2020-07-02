class Image < ApplicationRecord
  has_many :media_files, dependent: :restrict_with_exception

  validates_presence_of :name, :file_path

  def full_path
    "#{file_path}#{file_name}"
  end

  def file_name
    name.titleize.tr(' ', '-')
  end
end
