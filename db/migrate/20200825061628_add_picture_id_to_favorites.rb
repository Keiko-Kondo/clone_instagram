class AddPictureIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :picture_id, :integer
  end
end
