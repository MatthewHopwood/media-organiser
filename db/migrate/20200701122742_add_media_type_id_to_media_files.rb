class AddMediaTypeIdToMediaFiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :media_files, :media_type, foreign_key: true, null: false
  end
end
