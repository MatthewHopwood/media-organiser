class AddMediaFileIdToMediaTypes < ActiveRecord::Migration[6.0]
  def change
    add_reference :media_types, :media_file, foreign_key: true, null: false
  end
end
