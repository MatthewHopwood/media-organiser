class CreateMediaFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :media_files do |t|
      t.string :name, null: false
      t.string :file_path, null: false
      t.text :comment

      t.timestamps
    end
  end
end
