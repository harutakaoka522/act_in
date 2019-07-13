class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image_title
      t.text :image
      t.text :image_content

      t.timestamps
    end
  end
end
