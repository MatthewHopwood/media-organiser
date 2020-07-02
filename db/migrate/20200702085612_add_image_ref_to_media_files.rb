class AddImageRefToMediaFiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :media_files, :image, foreign_key: true
  end
end
