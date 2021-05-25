class RenameCoverImageToSnakeCase < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :coverImage, :cover_image
  end
end
