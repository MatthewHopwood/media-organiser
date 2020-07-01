class CreateMediaFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :media_files do |t|
      t.string :name
      t.string :file_path
      t.string :comment

      t.timestamps
    end
  end
end
