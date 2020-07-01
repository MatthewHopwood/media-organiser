class CreatePlaylistMediaFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_media_files do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :media_file, null: false, foreign_key: true

      t.timestamps
    end
  end
end
