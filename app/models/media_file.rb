class MediaFile < ApplicationRecord

  def full_path
    "#{file_path}#{file_name}"
  end

  def file_name
    name.tr(' ', '-').downcase
  end
end
