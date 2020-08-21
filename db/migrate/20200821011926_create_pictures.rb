class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :comment
      t.timestamps
    end
  end
end
