class AddMediaFileRefToMediaFileCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :media_file_categories, :media_file, null: false, foreign_key: true
  end
end
