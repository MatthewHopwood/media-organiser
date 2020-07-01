class CreateMediaFileCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :media_file_categories do |t|

      t.timestamps
    end
  end
end
